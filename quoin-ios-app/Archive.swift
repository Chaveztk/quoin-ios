import SwiftUI

struct PaymentHistoryView: View {
    @State private var isPaymentHistoryModalView = false
    @State private var selectedTerm: String = "" // State for storing the selected term
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
//                        Button(action: {
//                            // Add action for the back button
//                        }) {
//                            Image(systemName: "chevron.left")
//                                .font(.title)
//                                .foregroundColor(.black)
//                        }
//                        .padding(.leading, 20)
//                        Spacer() // Spacer before the text
                        
//                        VStack {
//                            Text("Logo here")
//                                .font(.title3)
//                                .multilineTextAlignment(.center) // Align text in center
//                                .foregroundColor(.gray)
//                                .padding(.horizontal) // Add padding for centering
//                                .fontWeight(.bold)
//
//                            
//                        }
//                        .frame(maxWidth: .infinity) // Ensure VStack takes full width

                        Spacer() // Spacer after the text
//                        Button(action: {
//                            // Add action for the plus button
//                        }) {
//                            Image(systemName: "line.horizontal.3")
//                                .font(.title)
//                                .foregroundColor(.black)
//                        }
//                        .padding(.trailing, 20)
                    }
                    .padding(.horizontal)
                    .padding(.top, 50)


                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Text("Payment History")
                                .font(.title3)
                                .padding(.leading, 20)
                                .fontWeight(.bold)

                            Spacer()

                            Button(action: {
                                // Add action for the "see all" button
                            }) {
                                Text("See All")
                                    .foregroundColor(.blue)
                                    .padding(.trailing, 20)
                                    .fontWeight(.bold)
                            }
                        }
                        .padding(.bottom, 5)

                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            TextField("Search Documents", text: $searchText)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.bottom)
                                .fontWeight(.bold)
                        }
                        .padding(.horizontal, 20)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                Button(action: {
                                    // Add action for Rent button
                                }) {
                                    Text("Paid")
                                        .font(.headline)
                                        .padding(9)
                                        .frame(maxWidth: .infinity)
                                        .background(Color(hex: "#F5F5F"))
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                        .fixedSize(horizontal: true, vertical: false)
                                }
                                Button(action: {
                                    // Add action for Documents button
                                }) {
                                    Text("Over Due")
                                        .font(.headline)
                                        .padding(9)
                                        .frame(maxWidth: .infinity)
                                        .background(Color(hex: "#F5F5F"))
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                        .fixedSize(horizontal: true, vertical: false)
                                }
                                Button(action: {
                                    // Add action for Date Order button
                                }) {
                                    Text("Sort by Date")
                                        .font(.headline)
                                        .padding(9)
                                        .frame(maxWidth: .infinity)
                                        .background(Color(hex: "#F5F5F"))
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                        .fixedSize(horizontal: true, vertical: false)
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(0)
                        }

                        VStack {
                            ForEach(0..<3) { index in
                                Button(action: {
                                    selectedTerm = "Paid"
                                    isPaymentHistoryModalView.toggle()
                                }) {
                                    PaymentHistoryCardView(propertyName: "Canary Wharf \(index + 1)",
                                                    propertyAddress: "Received 11th April 24",
                                                    rent: "£1000.00",
                                                    term: "Paid",
                                                    paid: "")
                                    .padding(.horizontal, 15)
                                    .padding(.top, 10)
                                    .shadow(radius: 5)

                                }
                            }
                        }
                        VStack {
                            ForEach(0..<3) { index in
                                Button(action: {
                                    selectedTerm = "Over Due"
                                    isPaymentHistoryModalView.toggle()
                                }) {
                                    PaymentHistoryCardView(propertyName: "Lewis Flat \(index + 1)",
                                                    propertyAddress: "Expected 9th April 24",
                                                    rent: "£870",
                                                    term: "Over Due",
                                                    paid: "")
                                    .padding(.horizontal, 15)
                                    .padding(.top, 10)
                                    .shadow(radius: 5)

                                }
                            }
                        }
                    }
                }
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
                .sheet(isPresented: $isPaymentHistoryModalView) {
                    PaymentHistoryModalView(term: selectedTerm)
                        .presentationDetents([.fraction(0.6)]) // Open modal to half screen
                }
            }
        }
    }
}

struct PaymentHistoryModalView: View {
    var term: String

    var body: some View {
        VStack {
            Capsule()
                .frame(width: 40, height: 5)
                .foregroundColor(.gray)
                .padding(.top, 20)

            Text("Payment History")
                .font(.body)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            Divider()

            // Profile Image
            VStack {
                
                
                Image("TerracedHouse")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .cornerRadius(10) // Rounds the corners
                    .shadow(radius: 5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2) // Adds a black outline
                        )
//                AsyncImage(url: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXSgAw09Xf8evPZEtY4iJd6fUxmo8PhoTkKQ&s")) { image in
//                    image
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 100, height: 100)
//                        .cornerRadius(10) // Rounds the corners
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 10)
//                                .stroke(Color.black, lineWidth: 2) // Adds a black outline
//                        )
//                        .clipped()
//                } placeholder: {
//                    Color.gray
//                        .frame(width: 100, height: 100)
//                        .cornerRadius(10)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 10)
//                                .stroke(Color.black, lineWidth: 2)
//                        )
//                }
//                .frame(width: 100, height: 100)
//                .padding(.top, 30)
                
//                Image(systemName: "photo")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 100, height: 100)
//                    .clipShape(Circle())
//                    .padding(.top, 30)
            }

            // Profile Information
            VStack(alignment: .center, spacing: 5) {
                HStack {
                    Text(term)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(term == "Over Due" ? .red : .green)
                    
                    if term == "Paid" {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                            .font(.title3)
                    }
                }
                
                if term == "Paid" {
                    Text("Payment received on 11th April 2024")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                }
                if term == "Over Due" {
                    HStack {
                        Text("Payment is over due by 3 days")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                        
                    }
                }

                
                Text("Address: 1 Canary Wharf, 1EE 370")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .fontWeight(.bold)

                Text("Tenant: John Doe")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .fontWeight(.bold)

                Text("Email: johndoe@gmail.com")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)

                HStack {
                    Text("Details:")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                    
                    if term == "Paid" {
                        Button(action: {
                            // Add action for the button
                        }) {
                            Text("Receipt")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                    } else if term == "Over Due" {
                        Button(action: {
                            // Add action for the button
                        }) {
                            Text("Pay now")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                    }
                }
//                .padding(.top, 10)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.bottom, 40)

            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .presentationCornerRadius(35)
    }
}

struct PaymentHistoryCardView: View {
    var propertyName: String
    var propertyAddress: String
    var rent: String
    var term: String
    var paid: String

    var body: some View {
        HStack {
            VStack {
                Text("APR")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("10")
                    .font(.subheadline)
            }
            .padding(.trailing, 5)

            VStack(alignment: .leading) {
                Text(propertyName)
                    .font(.headline)
                    .truncationMode(.tail)
                    .lineLimit(1)
                    .truncationMode(.middle)
                Text(propertyAddress)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .truncationMode(.tail)
                    .lineLimit(1)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(rent)
                    .font(.subheadline)
                    .fontWeight(.bold)
                Text(term)
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(term == "Over Due" ? .red : .green)
//                    .background(term == "Over Due" ? Color.red : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
//                    .shadow(radius: 5)


            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .foregroundColor(.black)
    }
}

#Preview {
    PaymentHistoryView()
}
