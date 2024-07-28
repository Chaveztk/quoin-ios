//
//  Pay.swift
//  quoin-ios-app
//
//  Created by Chavez King on 28/07/2024.
//

import Foundation
import SwiftUI
import Stripe

struct PayView: View {
    @State private var cardParams = STPPaymentMethodCardParams()
    @State private var isProcessing = false
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            STPPaymentCardTextField.Representable(cardParams: $cardParams)
                .padding()

            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }

            Button(action: processPayment) {
                Text(isProcessing ? "Processing..." : "Pay Now")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(isProcessing)
            .padding()
        }
        .padding()
    }

    func processPayment() {
        isProcessing = true
        errorMessage = nil

        let paymentMethodCardParams = STPPaymentMethodCardParams()
        paymentMethodCardParams.number = cardParams.number
        paymentMethodCardParams.expMonth = cardParams.expMonth
        paymentMethodCardParams.expYear = cardParams.expYear
        paymentMethodCardParams.cvc = cardParams.cvc

        let billingDetails = STPPaymentMethodBillingDetails()
        let paymentMethodParams = STPPaymentMethodParams(card: paymentMethodCardParams, billingDetails: billingDetails, metadata: nil)

        STPAPIClient.shared.createPaymentMethod(with: paymentMethodParams) { paymentMethod, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    self.isProcessing = false
                }
                return
            }

            guard let paymentMethod = paymentMethod else {
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to create Payment Method"
                    self.isProcessing = false
                }
                return
            }

            let paymentData: [String: Any] = [
                "payment_method": paymentMethod.stripeId,
                "amount": 5000,  // Example amount in cents
                "currency": "usd"
            ]

            guard let url = URL(string: "/api/process-payment/") else { return }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("{{ csrf_token }}", forHTTPHeaderField: "X-CSRFToken")

            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: paymentData, options: [])
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to serialize payment data"
                    self.isProcessing = false
                }
                return
            }

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    self.isProcessing = false

                    guard let data = data, error == nil else {
                        self.errorMessage = error?.localizedDescription ?? "Unknown error"
                        return
                    }

                    do {
                        if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                            print("Payment response: \(jsonResponse)")
                        } else {
                            self.errorMessage = "Invalid response data"
                        }
                    } catch {
                        self.errorMessage = "Failed to parse response data"
                    }
                }
            }
            task.resume()
        }
    }
}

struct Payment_Previews: PreviewProvider {
    static var previews: some View {
        PayView()
    }
}

extension STPPaymentCardTextField {
    struct Representable: UIViewRepresentable {
        @Binding var cardParams: STPPaymentMethodCardParams

        func makeUIView(context: Context) -> STPPaymentCardTextField {
            let cardTextField = STPPaymentCardTextField()
            cardTextField.delegate = context.coordinator
            return cardTextField
        }

        func updateUIView(_ uiView: STPPaymentCardTextField, context: Context) {
            // No need to update the view here
        }

        func makeCoordinator() -> Coordinator {
            Coordinator(cardParams: $cardParams)
        }

        class Coordinator: NSObject, STPPaymentCardTextFieldDelegate {
            @Binding var cardParams: STPPaymentMethodCardParams

            init(cardParams: Binding<STPPaymentMethodCardParams>) {
                _cardParams = cardParams
            }

            func paymentCardTextFieldDidChange(_ textField: STPPaymentCardTextField) {
                cardParams.number = textField.cardParams.number
                cardParams.expMonth = textField.cardParams.expMonth! as NSNumber
                cardParams.expYear = textField.cardParams.expYear! as NSNumber
                cardParams.cvc = textField.cardParams.cvc
            }
        }
    }
}
