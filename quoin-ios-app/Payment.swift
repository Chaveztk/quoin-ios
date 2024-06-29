import SwiftUI

struct PaymentView: View {
    //    @State private var balanceText = "Total Balance"
    //    @State private var amountText = "£1000.00"
    //    @State private var sumText = "Payment 1 of 2"
    
    @State private var isPayFullModalVisible = false
    @State private var isTransferModalVisible = false
    @State private var isConvertModalVisible = false
    
    // code from payment method page
    @State private var searchText = ""
    @State private var selectedCard: Int? = nil
    @State private var isPaymentMethodModalVisible = false
    @State private var isAddPaymentMethodModalVisible = false
    
    
    // code from archive page
    @State private var isPaymentHistoryModalView = false
    @State private var selectedTerm: String = "" // State for storing the selected term
    
    
    
    @State private var selectedOption: String? = "otherOption" // State for selected radio button
    
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 5) {
                    
                    VStack(alignment: .leading) {
                        
                        
                        // Information display
                        if selectedOption == "balanceTransfer" {
                            VStack(alignment: .center) {
                                Text("Total Balance")
                                    .font(.body)
                                    .fontWeight(.bold)
                                Text("£700.00")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("Payment in full")
                                    .font(.footnote)
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 20)
                            }
                            .frame(maxWidth: .infinity)
                            
                        } else if selectedOption == "otherOption" {
                            VStack(alignment: .center) {
                                Text("Total Balance")
                                    .font(.body)
                                    .fontWeight(.bold)
                                Text("£350.00")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("Payment 1 of 2")
                                    .font(.footnote)
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 20)
                                
                            }
                            .frame(maxWidth: .infinity)
                            //                            .padding()
                        }
                        
                        // Title above the cards
                        Text("Payment Options")
                            .font(.body)
                            .fontWeight(.bold)
                        //                            .padding(.top, 20)
                            .padding(.leading)
                        
                        // First Card
                        BalanceCardView(
                            title: "Total Account balance",
                            subtitle: "Pay in full",
                            number: "",
                            isSelected: selectedOption == "balanceTransfer",
                            action: {
                                selectedOption = "balanceTransfer"
                            },
                            isCreditCard: false // Not a credit card
                        )
                        .padding(.bottom, 5)
                        
                        // Second Card
                        BalanceCardView(
                            title: "Account balance",
                            subtitle: "Payment 1 of 2",
                            number: "",
                            isSelected: selectedOption == "otherOption",
                            action: {
                                selectedOption = "otherOption"
                            },
                            isCreditCard: false // Not a credit card
                        )
                    }
                    
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        VStack(spacing: 20) {
                            ScrollView(.horizontal, showsIndicators: false) {
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
                                    
                                    PaymentMethodCardView(
                                        heading: "•••• 7766",
                                        imageName: "MasterCard",
                                        systemImageName: "",
                                        showTick: selectedCard == 2,
                                        action: {
                                            self.selectedCard = 2
                                            self.isPaymentMethodModalVisible.toggle() // Toggle modal visibility
                                        },
                                        isPaymentMethodModalVisible: $isPaymentMethodModalVisible
                                    )
                                    
                                }
                                .padding(.horizontal) // Add padding if needed
                                .padding(.bottom, 30)
                                .padding(.top, 30)
                                
                            }
                        }
                    }
                    
                    HStack {
                        Text("Recent Transactions")
                            .fontWeight(.bold)
                            .font(.body)
                            .padding(.top, 20)
                            .padding(.bottom, 10)
                    }
                    .padding(.horizontal) // Add padding if needed
                    
                    VStack {
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            ForEach(0..<3) { index in
                                Button(action: {
                                    selectedTerm = "Paid"
                                    isPaymentHistoryModalView.toggle()
                                }) {
                                    PaymentHistoryCardView(
                                        propertyName: "Canary Wharf \(index + 1)",
                                        propertyAddress: "Received 11th April 24",
                                        rent: "£1000.00",
                                        term: "Paid",
                                        paid: ""
                                    )
                                    .padding(.horizontal, 15)
//                                    .padding(.top, 5)
                                    
                                    
                                }
                            }
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                        }
                        
                    }
                    
                    
                    
                    VStack {
                        //                        Text(balanceText)
                        //                            .font(.body)
                        //                            .fontWeight(.bold)
                        //
                        //                        Text(amountText)
                        //                            .font(.title)
                        //                            .fontWeight(.bold)
                        ////                            .padding(.bottom, 20) // Adjusted padding
                        //                        Text(sumText)
                        //                            .font(.footnote)
                        //                            .fontWeight(.bold)
                        //                            .foregroundColor(.gray)
                        //                            .padding(.bottom, 20) // Adjusted padding
                        
                        HStack(spacing: 20) { // Added spacing between buttons
                            Button(action: {
                                // Change the text when withdraw button is pressed
                                //                                balanceText = "Account Balance"
                                //                                amountText = "£3000.00"
                                //                                sumText = "Payment 1 of 2"
                            }) {
                                //                                HStack {
                                //                                    Image(systemName: "arrow.down.circle.fill")
                                //                                    Text("Total")
                                //                                        .fontWeight(.bold)
                                //                                }
                                //                                .padding()
                                //                                .frame(width: 150, height: 50) // Fixed width and height
                                //                                .background(Color.black)
                                //                                .foregroundColor(.white)
                                //                                .cornerRadius(30)
                            }
                            
                            Button(action: {
                                // Change the text when deposit button is pressed
                                //                                balanceText = "Total Balance"
                                //                                amountText = "£1000.00"
                                //                                sumText = "Payment In Full"
                            }) {
                                //                                HStack {
                                //                                    Image(systemName: "arrow.up.circle.fill")
                                //                                    Text("Balance")
                                //                                        .fontWeight(.bold)
                                //                                }
                                //                                .padding()
                                //                                .frame(width: 150, height: 50) // Fixed width and height
                                //                                .background(Color.black)
                                //                                .foregroundColor(.white)
                                //                                .cornerRadius(30)
                            }
                        }
                        //                        .padding()
                        
                        //                        Spacer()
                    }
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    //                    HStack(spacing: 20) {
                    //                        Spacer()
                    //                        CircleButton(imageName: "arrow.down.circle.fill", label: "Add Card")
                    //                            .onTapGesture {
                    //                                isPayFullModalVisible = true
                    //                            }
                    //                        CircleButton(imageName: "arrow.right.circle.fill", label: "Transfer")
                    //                            .onTapGesture {
                    //                                isTransferModalVisible = true
                    //                            }
                    //                        CircleButton(imageName: "arrow.left.arrow.right.circle.fill", label: "Convert")
                    //                            .onTapGesture {
                    //                                isConvertModalVisible = true
                    //                            }
                    //                        Spacer()
                    //                    }
                    //                    .padding(.horizontal)
                    //                    .padding(.bottom, 10)
                }
                .padding(.top, 30)
            }
            
            Spacer()
            
            Button(action: { }) {
                HStack {
                    Image(systemName: "creditcard") // Payment icon
                        .foregroundColor(.white)
                        .padding(.trailing, 2) // Adjust the spacing between icon and text
                    Text("Pay")
                        .font(.title3)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .sheet(isPresented: $isPayFullModalVisible) {
            PayFullModalView()
                .presentationDetents([.fraction(0.6)]) // Open modal to half screen
        }
        .sheet(isPresented: $isTransferModalVisible) {
            TransferModalView()
                .presentationDetents([.fraction(0.6)]) // Open modal to half screen
        }
        .sheet(isPresented: $isConvertModalVisible) {
            ConvertModalView()
                .presentationDetents([.fraction(0.5)]) // Open modal to half screen
        }
    }
}

struct BalanceCardView: View {
    let title: String
    let subtitle: String
    let number: String
    let isSelected: Bool
    let action: () -> Void
    let isCreditCard: Bool // Add a parameter to determine if the view should show the credit card icon
    
    var body: some View {
        Button(action: action) {
            HStack {
                if isCreditCard {
                    //                    Image(systemName: isSelected ? "circle.fill" : "circle")
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 12, height: 12)
                    Image(systemName: "creditcard.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundColor(.black)
                } else {
                    ZStack {
                        Image(systemName: isSelected ? "circle.fill" : "circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .foregroundColor(isSelected ? .white : .gray)
                        if isSelected {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 12, height: 12)
                        }
                    }
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(title)
                            .font(.title3)
                            .fontWeight(.bold)
                        Spacer()
                        Text(number)
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                    }
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(isSelected ? Color(hex: "#F5F5F5") : .white))
                    .shadow(color: .gray, radius: 1, x: 0, y: 1)
            )
            .padding(.horizontal)
        }
        .foregroundColor(.black)
    }
}


struct PayFullModalView: View {
    var body: some View {
        VStack {
            // Form start
            VStack(spacing: 15) {
                Capsule()
                    .frame(width: 40, height: 5)
                    .foregroundColor(.gray)
                    .padding(.top, 20)
                
                Text("Add Payment details")
                    .font(.body)
                    .fontWeight(.bold)
                Divider()
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text("Card Number")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    HStack {
                        Image(systemName: "creditcard")
                            .foregroundColor(.gray)
                            .padding(.leading)
                        
                        TextField("1234 5678 1234 5678", text: .constant(""))
                            .keyboardType(.numberPad)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                    }
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
                .padding(.bottom, 5)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Expiry Date")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(.gray)
                            .padding(.leading)
                        
                        TextField("MM/YY", text: .constant(""))
                            .keyboardType(.numberPad)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                    }
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
                .padding(.bottom, 5)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("CVV")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(.gray)
                            .padding(.leading)
                        
                        SecureField("123", text: .constant(""))
                            .keyboardType(.numberPad)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                    }
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
                .padding(.bottom, 5)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Name on Card")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.gray)
                            .padding(.leading)
                        
                        TextField("John Doe", text: .constant(""))
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                    }
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
                .padding(.bottom, 5)
                
                Spacer()
                
                Button(action: {
                    // Add your action here
                }) {
                    Text("Submit")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.bottom, 50)
            }
            .padding()
        }
        .padding()
    }
}


struct TransferModalView: View {
    var body: some View {
        VStack {
            // Form start
            VStack(spacing: 15) {
                Capsule()
                    .frame(width: 40, height: 5)
                    .foregroundColor(.gray)
                    .padding(.top, 20)
                
                Text("Transfer Balance")
                    .font(.body)
                    .fontWeight(.bold)
                Divider()
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text("Recipient Name")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.gray)
                            .padding(.leading)
                        
                        TextField("John Doe", text: .constant(""))
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                    }
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
                .padding(.bottom, 5)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Account Number")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    HStack {
                        Image(systemName: "number")
                            .foregroundColor(.gray)
                            .padding(.leading)
                        
                        TextField("123456789", text: .constant(""))
                            .keyboardType(.numberPad)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                    }
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
                .padding(.bottom, 5)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Sort Code")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    HStack {
                        Image(systemName: "number")
                            .foregroundColor(.gray)
                            .padding(.leading)
                        
                        TextField("12-34-56", text: .constant(""))
                            .keyboardType(.numberPad)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                    }
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
                .padding(.bottom, 5)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Amount")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    HStack {
                        Image(systemName: "sterlingsign.circle.fill")
                            .foregroundColor(.gray)
                            .padding(.leading)
                        
                        TextField("£0.00", text: .constant(""))
                            .keyboardType(.decimalPad)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                    }
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
                .padding(.bottom, 5)
                
                Spacer()
                
                Button(action: {
                    // Add your action here
                }) {
                    Text("Submit")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.bottom, 50)
            }
            .padding()
        }
        .padding()
    }
}


struct ConvertModalView: View {
    var body: some View {
        VStack {
            // Form start
            VStack(spacing: 15) {
                Capsule()
                    .frame(width: 40, height: 5)
                    .foregroundColor(.gray)
                    .padding(.top, 20)
                
                Text("Convert Currency")
                    .font(.body)
                    .fontWeight(.bold)
                Divider()
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text("From")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    HStack {
                        Image(systemName: "sterlingsign.circle.fill")
                            .foregroundColor(.gray)
                            .padding(.leading)
                        
                        TextField("£0.00", text: .constant(""))
                            .keyboardType(.decimalPad)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                    }
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
                .padding(.bottom, 5)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("To")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    HStack {
                        Image(systemName: "dollarsign.circle.fill")
                            .foregroundColor(.gray)
                            .padding(.leading)
                        
                        TextField("$0.00", text: .constant(""))
                            .keyboardType(.decimalPad)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                    }
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
                .padding(.bottom, 5)
                
                Spacer()
                
                Button(action: {
                    // Add your action here
                }) {
                    Text("Submit")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.bottom, 50)
            }
            .padding()
        }
        .padding()
    }
}


// Preview
struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
