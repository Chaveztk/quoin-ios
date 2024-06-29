

import SwiftUI

struct UpcomingView: View {
    @State private var searchText = ""
//    @State private var activeSection: String? = "Properties"


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
                        
                        VStack {
                            Text("")
                                .font(.headline)
                                .multilineTextAlignment(.center) // Align text in center
                                .padding(.horizontal) // Add padding for centering

                            Text("")
                                .font(.subheadline)
                                .multilineTextAlignment(.center) // Align text in center
                                .padding(.horizontal) // Add padding for centering
                        }
                        .frame(maxWidth: .infinity) // Ensure VStack takes full width

                        Spacer() // Spacer after the text
//                        Button(action: {
//                            // Add action for the plus button
//                        }) {
//                            Image(systemName: "plus")
//                                .font(.title)
//                                .foregroundColor(.black)
//                        }
//                        .padding(.trailing, 20)
                    }
                    .padding(.top, 40)
                    .padding(.horizontal)
                    
                    //                    Image(systemName: "photo")
                    //                        .resizable()
                    //                        .aspectRatio(contentMode: .fit)
                    //                        .frame(width: 200, height: 200)
                    //                        .padding()

                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    .padding(.vertical, 5)

                    // Properties section
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Text("Up Coming")
                                .font(.title3)
                                .padding(.leading, 20)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Button(action: {
                                // Add action for the "see all" button
                            }) {
                                Text("See All")
                                    .foregroundColor(.blue) // Change button color to blue
                                    .padding(.trailing, 20)
                                    .fontWeight(.bold)
                            }
                            
                        }
                        .padding(.bottom, 5)

                        // Search bar
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            TextField("Search Documents", text: $searchText)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.bottom)
                                .fontWeight(.bold)
                        }
                        .padding(.horizontal, 20)
                        
                        
//                        // Button in a row start
//                        ScrollView(.horizontal, showsIndicators: false) {
//                            VStack {
//                                ButtonRow(selectedSection: Binding(
//                                    get: { selectedSection ?? "Properties" }, // Default to "Properties" if nil
//                                    set: { selectedSection = $0 }
//                                ), buttons: ["Date", "Rent", "Documents", "This month"], colorHex: "#F5F5F")
//                            }
//                        }
//                        // Buttons in a row end
                        
                        
                        // Button in a row cards start
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                Button(action: {
                                    // Add action for Rent button
                                }) {
                                    Text("Date")
                                        .font(.headline)
                                        .padding(9)
                                        .frame(maxWidth: .infinity)
                                        .background(Color(hex: "#F5F5F")) // Change background color
                                        .foregroundColor(.white) // Change text color
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                        .fixedSize(horizontal: true, vertical: false)
                                }
                                Button(action: {
                                    // Add action for Documents button
                                }) {
                                    Text("Rent")
                                        .font(.headline)
                                        .padding(9)
                                        .frame(maxWidth: .infinity)
                                        .background(Color(hex: "#F5F5F")) // Change background color
                                        .foregroundColor(.white) // Change text color
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                        .fixedSize(horizontal: true, vertical: false)
                                }
                                Button(action: {
                                    // Add action for Date Order button
                                }) {
                                    Text("Documents")
                                        .font(.headline)
                                        .padding(9)
                                        .frame(maxWidth: .infinity)
                                        .background(Color(hex: "#F5F5F")) // Change background color
                                        .foregroundColor(.white) // Change text color
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                        .fixedSize(horizontal: true, vertical: false)
                                }
                                Button(action: {
                                    // Add action for Date Order button
                                }) {
                                    Text("This month")
                                        .font(.headline)
                                        .padding(9)
                                        .frame(maxWidth: .infinity)
                                        .background(Color(hex: "#F5F5F")) // Change background color
                                        .foregroundColor(.white) // Change text color
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                        .fixedSize(horizontal: true, vertical: false)
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(0)
                        }
                        
                        // Button in a row cards end


                        // Property cards
                        VStack {
                            ForEach(0..<3) { index in
                                UpcomingCardView(propertyName: "Payment due in 4 days \(index + 1)",
                                                 propertyAddress: "1 Canary Wharf",
                                                 rent: "£1000.00",
                                                 term: "25th March",
                                                 month: "APR",
                                                 date: "11")
                                    .padding(.horizontal, 15)
                                    .padding(.top, 10)
                            }
                            .shadow(radius: 5)
                            .background(Color.white)


                        }
                        VStack {
                            ForEach(0..<3) { index in
                                UpcomingCardView(propertyName: "Gas check due in 4 days \(index + 1)",
                                                 propertyAddress: "1 Canary Wharf",
                                                 rent: "",
                                                 term: "",
                                                 month: "APR",
                                                 date: "10")
                                    .padding(.horizontal, 15)
                                    .padding(.top, 10)
                            }
                        }
                        .shadow(radius: 5)
                        .background(Color.white)


                    }
                }
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
            }
        }
    }
}

struct UpcomingCardView: View {
    var propertyName: String
    var propertyAddress: String
    var rent: String
    var term: String
    var month: String
    var date: String

    var body: some View {
        HStack {
            // Replace image holder and folder with "APR" and "10"
            VStack {
                Text(month)
                    .font(.headline)
                    .fontWeight(.bold)
                Text(date)
                    .font(.subheadline)
            }
            .padding(.trailing, 5)
            
            VStack(alignment: .leading) {
                Text(propertyName)
                    .font(.headline)
                    .truncationMode(.tail)
                    .lineLimit(1)
                    .truncationMode(.middle) // Change truncation mode to middle
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
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
    }
}

#Preview {
    UpcomingView()
}

