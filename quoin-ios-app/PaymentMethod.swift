import SwiftUI

struct PaymentMethodView: View {
    @State private var searchText = ""
    @State private var selectedCard: Int? = nil
    @State private var isPaymentMethodModalVisible = false
    @State private var isAddPaymentMethodModalVisible = false

    var body: some View {
        NavigationView {
            ZStack {
                Background()

                ScrollView {
                    VStack(spacing: 20) {
                        HStack {
//                            Button(action: {}) {
//                                Image(systemName: "chevron.left")
//                                    .font(.title)
//                                    .foregroundColor(.black)
//                            }
//                            .padding(.leading, 20)

                            Spacer()

                            Text("Payment Methods")
                                .font(.headline)

                            Spacer()

//                            Button(action: {}) {
//                                Image(systemName: "plus")
//                                    .font(.title)
//                                    .foregroundColor(.black)
//                            }
//                            .padding(.trailing, 20)
                        }
                        .padding(.top, 20)
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                        
                        
                        HStack {
                            Text("Payment Methods")
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                                .frame(maxWidth: .infinity, alignment: .leading) // Align text to the far left
                                .padding(.top, 50)
                                    }
                        VStack(alignment: .leading, spacing: 20) {

                            VStack(spacing: 20) {
                                HStack(spacing: 20) {
                                    PaymentMethodCardView(
                                        heading: "•••• 4921",
                                        imageName: "VisaIcon",
                                        systemImageName: "",
                                        showTick: selectedCard == 0,
                                        action: {
                                            self.selectedCard = 0
                                            self.isPaymentMethodModalVisible.toggle() // Toggle modal visibility
                                        },
                                        isPaymentMethodModalVisible: $isPaymentMethodModalVisible
                                    )

                                    PaymentMethodCardView(
                                        heading: "•••• 7766",
                                        imageName: "MasterCard",
                                        systemImageName: "",
                                        showTick: selectedCard == 1,
                                        action: {
                                            self.selectedCard = 1
                                            self.isPaymentMethodModalVisible.toggle() // Toggle modal visibility
                                        },
                                        isPaymentMethodModalVisible: $isPaymentMethodModalVisible
                                    )
                                }

                                HStack(spacing: 20) {
                                    PaymentMethodCardView(
                                        heading: "•••• 5477",
                                        imageName: "AmericanExpress",
                                        systemImageName: "",
                                        showTick: selectedCard == 2,
                                        action: {
                                            self.selectedCard = 2
                                            self.isPaymentMethodModalVisible.toggle() // Toggle modal visibility
                                        },
                                        isPaymentMethodModalVisible: $isPaymentMethodModalVisible
                                    )

                                    PaymentMethodCardView(
                                        heading: "•••• 5477",
                                        imageName: "AmericanExpress",
                                        systemImageName: "",
                                        showTick: selectedCard == 3,
                                        action: {
                                            self.selectedCard = 3
                                            self.isPaymentMethodModalVisible.toggle() // Toggle modal visibility
                                        },
                                        isPaymentMethodModalVisible: $isPaymentMethodModalVisible
                                    )
                                }
                                HStack(spacing: 20) {
                                    PaymentMethodCardView(
                                        heading: "",
                                        imageName: "",
                                        systemImageName: "plus",
                                        showTick: false,
                                        action: {
                                            self.isAddPaymentMethodModalVisible.toggle() // Toggle modal visibility
                                        },
                                        isPaymentMethodModalVisible: $isAddPaymentMethodModalVisible
                                    )
                                }
                                
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 12)
                        }
                    }
                    .navigationBarTitle("", displayMode: .inline)
                    .navigationBarHidden(true)
                }
            }
            .sheet(isPresented: $isPaymentMethodModalVisible) {
                PaymentMethodModalView()
                    .presentationDetents([.fraction(0.5)]) // Open modal to half screen
            }
            .sheet(isPresented: $isAddPaymentMethodModalVisible) {
                AddPaymentMethodModalVisible()
                    .presentationDetents([.fraction(1)]) // Open modal to half screen
            }
        }
    }
}

struct PaymentMethodCardView: View {
    var heading: String
    var imageName: String
    var systemImageName: String
    var showTick: Bool
    var action: () -> Void
    @Binding var isPaymentMethodModalVisible: Bool

    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                if showTick {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                        .font(.title3)
                        .padding(8)
                        .clipShape(Circle())
                        .offset(x: 47, y: -3)
                }
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 60)
                    .padding(.top, 5)
                    .foregroundColor(.black)
                Image(systemName: systemImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 50)
                    .padding(.top, 20)
//                    .foregroundColor(Color(hex: "#DA99FF")) // Purple color
                    .foregroundColor(.purple)


            }

            Text(heading)
                .font(.headline)
                .padding(.bottom, 10)
                .foregroundColor(.black)
        }
        .frame(width: 140, height: 100)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(showTick ? Color.green : Color.clear, lineWidth: 2)
        )
        .onTapGesture {
            action()
        }
    }
}


struct PaymentMethodModalView: View {
    @Environment(\.presentationMode) var presentationMode // Environment variable to handle modal dismissal

    var body: some View {
        VStack(spacing: 20) {
//            Capsule()
//                .frame(width: 40, height: 5)
//                .foregroundColor(.gray)
            
//            Text("Card Method")
//                .font(.body)
//                .fontWeight(.bold)
//                .padding(.bottom, 10)
//            Divider()
            HStack {
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Dismiss the modal
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color(hex: "#D3D3D3")) // Lighter gray color
                        .font(.title)
                }
                .padding(.top, 30)
            }
            
            Image("VisaIcon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 30)
                .foregroundColor(.black)
            
            HStack {
                Text("Card Number")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                Text("•••• 7766") // Updated card number format
                    .font(.body)
                    .foregroundColor(.black)
                    .padding(.leading, 10) // Adjust the padding as needed
            }
            
            HStack {
                Text("Expiry Date")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                Text("MM/YY") // Replace with actual expiry date
                    .font(.body)
                    .foregroundColor(.black)
                    .padding(.leading, 10) // Adjust the padding as needed
            }
            
            HStack {
                Text("Billing Address")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                Text("123 Canary Wharf, London, SW2 2NP")
                    .font(.body)
                    .foregroundColor(.black)
                    .padding(.leading, 10) // Adjust the padding as needed
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true) // Allow the text to wrap within the available space

                    .lineLimit(nil)
            }
            
            Button(action: {
                // Action for "Set as Default" button
            }) {
                Text("Set as Default")
                    .font(.title3)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding()
                    .cornerRadius(10)
                    .background(Color(hex: "#DA99FF"))
                    .cornerRadius(10)
                    
            }
            .frame(maxWidth: .infinity) // Expand button width
            
            Button(action: { }) {
                HStack {
                    Image(systemName: "trash") // Payment icon
                        .foregroundColor(.white)
                        .padding(.trailing, 2) // Adjust the spacing between icon and text
                    Text("Delete")
                        .font(.title3)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(hex: "#F8B6BD")) // Change background color
                .cornerRadius(10)
            }
            .frame(maxWidth: .infinity) // Expand button width
        }
        .padding(20)
        .edgesIgnoringSafeArea(.all)
        .presentationCornerRadius(35)

    }
}

struct AddPaymentMethodModalVisible: View {
    @Environment(\.presentationMode) var presentationMode // Environment variable to handle modal dismissal
    @State private var cardNumber: String = ""
    @State private var expiryDate: String = ""
    @State private var cvv: String = ""
    @State private var name: String = ""
    @State private var addressLine1: String = ""
    @State private var addressLine2: String = ""
    @State private var country: String = ""
    @State private var postCode: String = ""
    @State private var city: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Background()

                VStack(spacing: 20) {
                    HStack {
                        Spacer()
                        Button(action: {
                            presentationMode.wrappedValue.dismiss() // Dismiss the modal
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(Color(hex: "#D3D3D3")) // Lighter gray color
                                .font(.title)
                        }
                    }
//                    Capsule()
//                        .frame(width: 40, height: 5)
//                        .foregroundColor(.gray)
//                    
//                    Divider()
                    Image(systemName: "creditcard")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 100)
                        .foregroundColor(.black)
                        .padding(.top, 10)
                    
                    
                    VStack(spacing: 15) {
                        HStack {
                            TextField("16 Card Number", text: $cardNumber)
                                .textFieldStyle(PlainTextFieldStyle())
                                .autocapitalization(.none)
                                .keyboardType(.numberPad)
                                .disableAutocorrection(true)
                                .padding(10)
                            TextField("MM/YY", text: $expiryDate)
                                .textFieldStyle(PlainTextFieldStyle())
                                .autocapitalization(.none)
                                .keyboardType(.numberPad)
                                .disableAutocorrection(true)
                                .padding(10)
                            TextField("CVV", text: $cvv)
                                .textFieldStyle(PlainTextFieldStyle())
                                .autocapitalization(.none)
                                .keyboardType(.numberPad)
                                .disableAutocorrection(true)
                                .padding(10)
                        }
                        
                        HStack {
                            Text("Billing Address")
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                            Spacer()
                        }
                        
                        TextField("Name", text: $name)
                            .textFieldStyle(PlainTextFieldStyle())
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding(10)
                        TextField("Address Line 1", text: $addressLine1)
                            .textFieldStyle(PlainTextFieldStyle())
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding(10)
                        TextField("Address Line 2", text: $addressLine2)
                            .textFieldStyle(PlainTextFieldStyle())
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding(10)
                        TextField("Country", text: $country)
                            .textFieldStyle(PlainTextFieldStyle())
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding(10)
                        TextField("Post Code", text: $postCode)
                            .textFieldStyle(PlainTextFieldStyle())
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding(10)
                        TextField("City", text: $city)
                            .textFieldStyle(PlainTextFieldStyle())
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding(10)
                    }
                    .padding(.top, 20)
                    .fontWeight(.bold)

                    HStack {
                        Image(systemName: "square.and.arrow.down")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold)) // Thicker icon
                            .padding(.trailing, 2) // Adjust spacing if needed
                        Text("Save")
                            .font(.title3)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.trailing)
                    }
                    .frame(maxWidth: .infinity)
                    .padding() // Add padding to ensure the content is well-spaced within the button
                    .background(Color(hex: "#DA99FF")) // Change background color
//                    .background(Color(hex: "#96CB94")) // Change background color
//                    .background(Color(hex: "#6544E2")) // Change background color


                    .cornerRadius(10)
                    
                }
                .padding()

            }
        }
        .edgesIgnoringSafeArea(.all)
        .presentationCornerRadius(35)
    }
}





struct PaymentMethodView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentMethodView()
    }
}
