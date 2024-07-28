import SwiftUI
import Stripe

struct PayView: View {
    @State var paymentId: String
    @State private var paymentMethodParams: STPPaymentMethodParams?
    @State private var isLoading: Bool = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var tokenStripe: String = ""
    @AppStorage("userId") private var userId: Int = 1

    var body: some View {
        VStack {
            Loading(isLoading: $isLoading)
            STPPaymentCardTextField.Representable(paymentMethodParams: $paymentMethodParams)
                .padding()
            
            Button(action: {
                Task {
                    await createToken()
                }
            }) {
                Text("Get Token")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Stripe Token"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
        .padding()
    }

    func createToken() async {
        isLoading = true
        let cardParams: STPCardParams = STPCardParams()
        if let payMethod = paymentMethodParams, let mCard = payMethod.card {
            cardParams.number = mCard.number
            if let cardExpMonth = mCard.expMonth, let cardExpYear = mCard.expYear {
                cardParams.expMonth = cardExpMonth.uintValue
                cardParams.expYear = cardExpYear.uintValue
            }
            cardParams.cvc = mCard.cvc
            isLoading = false
            alertMessage = "Payment"
            STPAPIClient.shared.createToken(withCard: cardParams) { (token, error) in
                if let token = token {
                    tokenStripe = token.tokenId
                    print(tokenStripe)
                    Task {
                        do {
                            let resultPay = try await makePayment(userId: userId, stripeToken: tokenStripe, paymentDue: paymentId)
                            alertMessage = "Payment Successful. You will receive a receipt to your registered email."
                        } catch {
                            alertMessage = "Payment failed: \(error.localizedDescription)"
                        }
                    }
                    showAlert = true
                }
                isLoading = false
            }
        }
    }
}




