
import SwiftUI
import Foundation

struct PropertyView: View {
    @State private var selectedSection: String? = nil
    @State private var navigateToHome = false
    @State private var activeSection: String? = "Term"
    

    
    
    
    var body: some View {
        NavigationView {
            NavigationStack {
                ScrollView(.vertical) {
                    VStack {
                        ZStack {
                            
                            Background()
                            BackgroundImage(imageUrl: "https://www.bankrate.com/2022/08/04093343/Buying-a-house-with-an-LLC.jpg?auto=webp&optimize=high&crop=16:9&width=912")
                                .frame(height: UIScreen.main.bounds.height / 4) // Set the height to half the screen
                                .edgesIgnoringSafeArea(.top) // Ignore safe area to cover the status bar
                            //                        Image(systemName: "photo")
                            //                            .resizable()
                            //                            .aspectRatio(contentMode: .fit)
                            //                            .frame(width: 200, height: 200)
                            //                            .padding(.top, 80)
                            
                            VStack {
                                HStack {
                                    NavigationLink(destination: HomeView(), isActive: $navigateToHome) {
                                        EmptyView()
                                    }
//                                    Button(action: {
//                                        navigateToHome = true
//                                    }) {
//                                        Image(systemName: "chevron.left")
//                                            .font(.title)
//                                            .foregroundColor(.black)
//                                    }
//                                    .padding(.leading, 20)
                                    
//                                    Spacer() // Add spacer before the text
//                                    
//                                    VStack {
//                                        Text("1 Canary Wharf")
//                                            .font(.headline)
//                                        Text("E14 5DR")
//                                            .font(.subheadline)
//                                    }
//                                    
//                                    Spacer() // Add spacer after the text
                                    
//                                    Button(action: {
//                                        // Add action for the plus button
//                                    }) {
//                                        Image(systemName: "plus")
//                                            .font(.title)
//                                            .foregroundColor(.black)
//                                    }
//                                    .padding(.trailing, 20)
                                }
                                .padding(.top, 40) // Add extra padding to clear the status bar area
                                .padding(.horizontal)
                                
                                Spacer()
                            }
                        }
                        
                        VStack {
                            // Subheading: "1 Canary Wharf"
                            //                        Text("1 Canary Wharf")
                            //                            .font(.headline)
                            //                            .padding(.top, 10)
                            //
                            //                        // Text: "E14 1FE"
                            //                        Text("E14 1FE")
                            //                            .font(.subheadline)
                            //                            .foregroundColor(.gray)
                            //                            .padding(.bottom, 1)
                            
                        }
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text("7 Limes Grove")
                                    .font(.headline)
                                    .padding(.horizontal)
                                    .fontWeight(.bold)
                                Spacer()
                                Text("£2000.00")
                                    .font(.headline)
                                    .padding(.horizontal)
                                    .fontWeight(.bold)
                            }
                            .padding(.top, 15)
                            HStack {

                                Text("E14 5DR")
                                    .font(.footnote)
                                    .padding(.horizontal)
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 10)
                                Spacer()
                                Text("Per Calender Month")
                                    .font(.footnote)
                                    .padding(.horizontal)
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 10)
                            }
                            
                            
                            
    
                            // Bed, Bath, Washing Machine, Square start
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    //                                Spacer()
                                    
                                    PropertyCardsInfo(imageName: "bed.double", text: "2")
                                    PropertyCardsInfo(imageName: "drop", text: "2")
                                    PropertyCardsInfo(imageName: "checkmark.seal", text: "2")
                                    PropertyCardsInfo(imageName: "square", text: "100")
                                    Spacer()
                                }
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                            }
                            // Bed, Bath, Washing Machine, Square end
                            Text("Description")
                                .font(.body)
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                                .fontWeight(.bold)
                                .padding(.top, 0)
                            
                            Text("This is a description of the property that is currently being rented for cheap. I made it cheap so it is affordable to all and every working class group. So there are no excuses to those who say they can't afford it")
                                .font(.body)
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                            //                                .lineLimit(3)
                            
                            
                            
                            //                        // Bed, Bath, Washing Machine, Square start
                            //                        ScrollView(.horizontal, showsIndicators: false) {
                            //                            HStack(spacing: 20) {
                            ////                                Spacer()
                            //
                            //                                PropertyCardsView(imageName: "bed.double", text: "2")
                            //                                PropertyCardsView(imageName: "drop", text: "2")
                            //                                PropertyCardsView(imageName: "checkmark.seal", text: "2")
                            //                                PropertyCardsView(imageName: "square", text: "100")
                            //
                            //                                Spacer()
                            //                            }
                            //                            .padding(.horizontal)
                            //                            .padding(.vertical, 5)
                            //                        }
                            //                        // Bed, Bath, Washing Machine, Square end
                            
                            
                            
                            // Buttin in a row start
                            
                            // Buttons in a row start
                            VStack {
                                        HStack {
//                                            Spacer()
                                            
                                            Button(action: {
                                                withAnimation {
                                                    selectedSection = selectedSection == "Term" ? nil : "Term"
                                                }
                                            }) {
                                                Text("Term")
                                                    .font(.body)
                                                    .padding(10)
                                                    .background(selectedSection == "Term" ? Color(hex: "#F5F5F") : Color.clear)
                                                    .cornerRadius(15)
                                                    .fontWeight(.bold)
                                                    .foregroundColor(selectedSection == "Term" ? .white : .gray)
                                            }
                                            
                                            Button(action: {
                                                withAnimation {
                                                    selectedSection = selectedSection == "Rent" ? nil : "Rent"
                                                }
                                            }) {
                                                Text("Rent")
                                                    .font(.body)
                                                    .padding(10)
                                                    .background(selectedSection == "Rent" ? Color(hex: "#F5F5F") : Color.clear)
                                                    .cornerRadius(15)
                                                    .fontWeight(.bold)
                                                    .foregroundColor(selectedSection == "Rent" ? .white : .gray)
                                            }
                                            
                                            Button(action: {
                                                withAnimation {
                                                    selectedSection = selectedSection == "Address" ? nil : "Address"
                                                }
                                            }) {
                                                Text("Address")
                                                    .font(.body)
                                                    .padding(10)
                                                    .background(selectedSection == "Address" ? Color(hex: "#F5F5F") : Color.clear)
                                                    .cornerRadius(15)
                                                    .fontWeight(.bold)
                                                    .foregroundColor(selectedSection == "Address" ? .white : .gray)
                                            }
                                            
//                                            Spacer()
                                        }
//                                        .padding()
                                        .padding(.bottom, -20)
                                        
                                        VStack {
                                            if selectedSection == "Term" {
                                                VStack(alignment: .center, spacing: 10) {
                                                    Text("Term")
                                                        .font(.body)
                                                        .fontWeight(.bold)
                                                    Text("May 1, 2024 to April 30, 2025.")
                                                        .font(.body)
                                                        .padding(.top, 5)
                                                }
//                                                .padding()
//                                                .background(Color.gray.opacity(0.1))
                                                .cornerRadius(8)
                                                .transition(.opacity)
                                            }
                                            
                                            if selectedSection == "Rent" {
                                                VStack(alignment: .center, spacing: 10) {
                                                    Text("Rent")
                                                        .font(.body)
                                                        .fontWeight(.bold)
                                                    Text("The monthly rent for this property is £2,500.")
                                                        .font(.body)
                                                        .padding(.top, 5)
                                                }
//                                                .padding()
//                                                .background(Color.gray.opacity(0.1))
                                                .cornerRadius(8)
                                                .transition(.opacity)
                                            }
                                            
                                            if selectedSection == "Address" {
                                                VStack(alignment: .center, spacing: 10) {
                                                    Text("Address")
                                                        .font(.body)
                                                        .fontWeight(.bold)
                                                    Text("Located: 1 Canary Wharf E14 1JJ.")
                                                        .font(.body)
                                                        .padding(.top, 5)
                                                }
//                                                .padding()
//                                                .background(Color.gray.opacity(0.1))
                                                .cornerRadius(8)
                                                .transition(.opacity)
                                            }
                                        }
                                        .frame(maxWidth: .infinity)

                                        .padding()
                                    }
                            
                            
                            // Buttons in a row end
                            
                            
                            
                            
                            
                            
//                                                    // Column 1
//                                                    VStack(alignment: .leading, spacing: 10) {
//                                                        HStack {
//                                                            Text("Deposit")
//                                                                .font(.headline)
//                                                            Spacer()
//                                                            Text("£1,700.0")
//                                                                .font(.subheadline)
//                                                                .foregroundColor(.gray)
//                                                        }
//                                                        HStack {
//                                                            Text("Term")
//                                                                .font(.headline)
//                                                            Spacer()
//                                                            Text("Mar 23, 2024 - May 20, 2024")
//                                                                .font(.subheadline)
//                                                                .foregroundColor(.gray)
//                                                        }
//                                                    }
//                                                    .padding(.horizontal, 20)
//                                                    .padding(.vertical, 10)
//                                                    .background(Color.white)
//                                                    .cornerRadius(10)
//                                                    .shadow(radius: 5)
//                            
//                                                    // Column 2
//                                                    VStack(alignment: .leading, spacing: 20) {
//                                                        HStack {
//                                                            Text("Rent")
//                                                                .font(.headline)
//                                                            Spacer()
//                                                            Text("£1,700.0")
//                                                                .font(.subheadline)
//                                                                .foregroundColor(.gray)
//                                                        }
//                                                        HStack {
//                                                            Text("Floor")
//                                                                .font(.headline)
//                                                            Spacer()
//                                                            Text("216")
//                                                                .font(.subheadline)
//                                                                .foregroundColor(.gray)
//                                                        }
//                                                    }
//                                                    .padding(.horizontal, 20)
//                                                    .padding(.vertical, 10)
//                                                    .background(Color.white)
//                                                    .cornerRadius(10)
//                                                    .shadow(radius: 5)
//                                                    .padding(.bottom, 20)
                            
                            
                            
                            // Progress Bar start
                            ProgressbarCardView(
                                        title: "Rent Payment",
                                        balance: "£1000",
                                        date: "2024",
                                        percentage: "50%",
                                        remaining: "Remaining rent £20,000",
                                        paymentNumber: "1 of 2",
                                        payNow: "Pay Now"
                                    )
                            // Progress bar end
                            
                            
                            
                            // Additional cards
                            HStack {
                                NavigationLink(destination: DocumentView()) {
                                    
                                    CardPropertyView(title: "Documents", detail: "", icon: "doc.text") // Using document icon
                                        .foregroundColor(.black)

                                }
                                NavigationLink(destination: MaintenanceLog()) {
                                    CardPropertyView(title: "Maintenance", detail: "", icon: "hammer") // Using maintenance icon
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 20)
                        
                    }
                    .padding(.bottom, 20)
                    .padding(.bottom, 20)
                }
                .navigationBarHidden(true) // Hide the navigation bar to show the custom back button instead
            }
        }
    }
}


struct CardPropertyView: View {
    var title: String
    var detail: String
    var icon: String?
    
    var body: some View {
        VStack {
            if let iconName = icon {
                Image(systemName: iconName) // Displaying the icon if available
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .foregroundColor(.black)
                    .padding(.bottom, 10)
            }
            
            Text(title)
                .font(.headline)
            Text(detail)
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .frame(width: 150, height: 150)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding()
    }
}



struct PropertyCardsInfo: View {
    var imageName: String
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20) // Increase the size of the images
            Text(text)
                .bold()
                .padding(.leading, 5) // Add some padding between image and text
        }
        .padding(8)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .frame(minWidth: 50, maxWidth: .infinity) // Adjusts width based on content
        .fixedSize(horizontal: true, vertical: false) // Prevents height from increasing
    }
}

//struct InfoRow: View {
//    var imageName: String
//    var color: Color
//    var text: String
//
//    var body: some View {
//        HStack {
//            Image(systemName: imageName)
//                .foregroundColor(color)
//            Text(text)
//                .padding(.leading)
//            Spacer()
//        }
//    }
//}


#Preview {
    PropertyView()
}















