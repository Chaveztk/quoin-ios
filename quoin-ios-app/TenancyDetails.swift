//
//  TenancyDetails.swift
//  quoin-ios-app
//
//  Created by Chavez King on 08/06/2024.
//

import SwiftUI
import Foundation

struct TenancyDetails: View {
    var dataId: URL
    
    var body: some View {
        BaseView(dataId: dataId) {(data: Tenancy) in
            VStack {
                Text("\(String(describing: data.rent_pm))")
            }
        }
    }
}

#Preview {
    TenancyView(dataId: URL(string:"http://me-quoin-management.us-east-1.elasticbeanstalk.com/api/tenancy/369c9a25-cc13-42fe-b4d1-32bff2cdc8f7")!)
}


struct TenancyView: View {
    var dataId: URL
    @State private var selectedSection: String? = nil
    @State private var isExpanded: Bool = false


    var body: some View {
        BaseView(dataId: dataId) {(data: Tenancy) in
        NavigationStack {
            ScrollView(.vertical) {
                VStack {
                    ZStack {
                        BackgroundImage()
                            .frame(height: UIScreen.main.bounds.height / 2) // Set the height to half the screen
                            .edgesIgnoringSafeArea(.top) // Ignore safe area to cover the status bar
                            .cornerRadius(30)
                        
                        VStack {
                            HStack {
                                Button(action: {
                                    // Add action for the back button
                                }) {
                                    Image(systemName: "chevron.left")
                                        .font(.title)
                                        .foregroundColor(.black)
                                }
                                .padding(.leading, 20)
                                
                                Spacer() // Add spacer before the text
                                
                                VStack {
                                    Text("1 Canary Wharf")
                                        .font(.headline)
                                    Text("E14 5DR")
                                        .font(.subheadline)
                                }
                                
                                Spacer() // Add spacer after the text
                                
                                Button(action: {
                                    // Add action for the plus button
                                }) {
                                    Image(systemName: "plus")
                                        .font(.title)
                                        .foregroundColor(.black)
                                }
                                .padding(.trailing, 20)
                            }
                            .padding(.top, 40) // Add extra padding to clear the status bar area
                            .padding(.horizontal)
                            
                            Spacer()
                        }
                        
                    }

                    
//                    VStack {
//                        // Subheading: "1 Canary Wharf"
//                        Text("1 Canary Wharf")
//                            .font(.headline)
//                            .padding(.top, 10)
//
//                        // Text: "E14 1FE"
//                        Text("E14 1FE")
//                            .font(.subheadline)
//                            .foregroundColor(.gray)
//                            .padding(.bottom, 1)
//
//                    }
//                    .frame(maxWidth: .infinity)
//                    .multilineTextAlignment(.center)
                    
                    // Buttons in a row start
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            withAnimation {
                                selectedSection = selectedSection == "Properties" ? nil : "Properties"
                            }
                        }) {
                            Text("Description")
                                .font(.body)
                                .padding(10)
                                .background(selectedSection == "Properties" ? Color(hex: "#F5F5F") : Color.clear)
                                .cornerRadius(15)
                                .fontWeight(.bold)
                                .foregroundColor(selectedSection == "Properties" ? .white : .gray)
                        }
                        .onAppear {
                            selectedSection = "Properties" // Set initial state to "Properties"
                        }
                        
                        Button(action: {
                            withAnimation {
                                selectedSection = selectedSection == "Maintenance" ? nil : "Maintenance"
                            }
                        }) {
                            Text("Term")
                                .font(.body)
                                .padding(10)
                                .background(selectedSection == "Maintenance" ? Color(hex: "#F5F5F") : Color.clear)
                                .cornerRadius(15)
                                .fontWeight(.bold)
                                .foregroundColor(selectedSection == "Maintenance" ? .white : .gray)
                        }
                        
                        Button(action: {
                            withAnimation {
                                selectedSection = selectedSection == "Block" ? nil : "Block"
                            }
                        }) {
                            Text("Rent")
                                .font(.body)
                                .padding(10)
                                .background(selectedSection == "Block" ? Color(hex: "#F5F5F") : Color.clear)
                                .cornerRadius(15)
                                .fontWeight(.bold)
                                .foregroundColor(selectedSection == "Block" ? .white : .gray)
                        }
                        
                        Button(action: {
                            withAnimation {
                                selectedSection = selectedSection == "Services" ? nil : "Services"
                            }
                        }) {
                            Text("Address")
                                .font(.body)
                                .padding(10)
                                .background(selectedSection == "Services" ? Color(hex: "#F5F5F") : Color.clear)
                                .cornerRadius(15)
                                .fontWeight(.bold)
                                .foregroundColor(selectedSection == "Services" ? .white : .gray)
                        }
                        
                        Spacer()
                    }
                    .padding()
                    .padding(.bottom, -5)
                    // Buttons in a row end

                    
                    
//                    VStack {
//                        // Subheading: "1 Canary Wharf"
//                        Text("1 Canary Wharf")
//                            .font(.headline)
//                            .padding(.top, 10)
//
//                        // Text: "E14 1FE"
//                        Text("E14 1FE")
//                            .font(.subheadline)
//                            .foregroundColor(.gray)
//                            .padding(.bottom, 1)
//
//                    }
//                    .frame(maxWidth: .infinity)
//                    .multilineTextAlignment(.center)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("1 Canary Wharf")
                                .font(.headline)
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                                .fontWeight(.bold)
                                .padding(.bottom, 5)
                                .padding(.top, -15)
                        }
                        
                        
                        if selectedSection == "Properties" {
                            HStack() {
                                Spacer()
                                Image(systemName: "bed.double")
                                Text("2")
                                Image(systemName: "drop")
                                Text("2")
                                Image(systemName: "checkmark.seal")
                                Text("2")
                                Image(systemName: "square")
                                Text("100")
                                Spacer()
                            }
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                            .padding(.bottom, 18)
                    .frame(minWidth: 80, maxWidth: .infinity)
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Description:")
                                    .fontWeight(.bold)
                                
                                Text("This is a description of the property that is currently being rented for cheap. I made it cheap so it is affordable to all and every working class group. So there are no excuses to those who say they can't afford it")
                                    .padding()
                                    .padding(.bottom, 15)
//                                    .lineLimit(isExpanded ? nil : 2)
                                
//                                Button(action: {
//                                    withAnimation {
//                                        isExpanded.toggle()
//                                    }
//                                }) {
//                                    Text(isExpanded ? "Read less" : "Read more")
//                                        .foregroundColor(.blue)
//                                }
                            }
                            .font(.body)
                            .cornerRadius(8)
                            .padding(.horizontal)
                            .transition(.opacity)

                        }


                        
                        if selectedSection == "Maintenance" {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Rented: 1 Jan 23 - 1 Jan 24")
//                                    .padding()
                            }
//                            .padding()
//                            .background(Color.gray.opacity(0.1))
//                            .cornerRadius(8)
                            .padding(.horizontal)
                            .transition(.opacity)
                        }
                        
                        if selectedSection == "Block" {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("\(String(describing: data.rent_pm))")
                                    .padding()
                            }
//                            .background(Color.gray.opacity(0.1))
//                            .cornerRadius(8)
                            .padding(.horizontal)
                            .transition(.opacity)
                        }
                        
                        if selectedSection == "Services" {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Services content goes here.")
                                    .padding()
                            }
//                            .background(Color.gray.opacity(0.1))
//                            .cornerRadius(8)
                            .padding(.horizontal)
                            .transition(.opacity)
                        }
                        
                       
                        
                        
                        
//                        // Column 1
//                        VStack(alignment: .leading, spacing: 10) {
//                            HStack {
//                                Text("Deposit")
//                                    .font(.headline)
//                                Spacer()
//                                Text("£1,700.0")
//                                    .font(.subheadline)
//                                    .foregroundColor(.gray)
//                            }
//                            HStack {
//                                Text("Term")
//                                    .font(.headline)
//                                Spacer()
//                                Text("Mar 23, 2024 - May 20, 2024")
//                                    .font(.subheadline)
//                                    .foregroundColor(.gray)
//                            }
//                        }
//                        .padding(.horizontal, 20)
//                        .padding(.vertical, 10)
//                        .background(Color.white)
//                        .cornerRadius(10)
//                        .shadow(radius: 5)
//
//                        // Column 2
//                        VStack(alignment: .leading, spacing: 20) {
//                            HStack {
//                                Text("Rent")
//                                    .font(.headline)
//                                Spacer()
//                                Text("£1,700.0")
//                                    .font(.subheadline)
//                                    .foregroundColor(.gray)
//                            }
//                            HStack {
//                                Text("Floor")
//                                    .font(.headline)
//                                Spacer()
//                                Text("216")
//                                    .font(.subheadline)
//                                    .foregroundColor(.gray)
//                            }
//                        }
//                        .padding(.horizontal, 20)
//                        .padding(.vertical, 10)
//                        .background(Color.white)
//                        .cornerRadius(10)
//                        .shadow(radius: 5)
//                        .padding(.bottom, 20)
                        
                        // Progress Bar start

                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text("Rent payment")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                Spacer()
                                Text("1-april - 1 may")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                            }
                            .padding(.bottom, 10)
                            
                            Text("Balance: £1000")
                                .font(.title) // Increased size of the balance
                                .fontWeight(.bold)
                            
                            ZStack(alignment: .center) {
                                ProgressView(value: 0.05)
                                    .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                                    .scaleEffect(x: 1, y: 4, anchor: .center)
                                
                                Text("5%")
                                    .font(.caption)
                                    .foregroundColor(.white)
                                    .bold()
                            }
                            
                            HStack {
                                Text("Remaining rent £20,000")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                Spacer()
                                Text("1 of 2")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            
                            Button(action: {
                                // Add action for the Pay Now button
                            }) {
                                Text("Pay Now")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color(.black))
                                    .cornerRadius(10)
                                
                            }
                            .padding(.horizontal) // Add horizontal padding here
                        }
                        .padding()
                        .background(Color.white) // Background color for the card
                        .cornerRadius(30) // Corner radius for the card
                        .shadow(radius: 15) // Shadow for the card

                        // Progress bar end

                        
                        // Additional cards
                        HStack {
                            CardView(title: "Documents", detail: "", icon: "doc.text") // Using document icon
                            CardView(title: "Maintenance", detail: "", icon: "hammer") // Using maintenance icon
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
                .padding(.bottom, 20)
            }
            .navigationBarHidden(true) // Hide the navigation bar to show the custom back button instead
        }
    }
}

struct BackgroundImage: View {
    var body: some View {
        GeometryReader { geometry in
            AsyncImage(url: URL(string: "https://www.bankrate.com/2022/08/04093343/Buying-a-house-with-an-LLC.jpg?auto=webp&optimize=high&crop=16:9&width=912")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
            } placeholder: {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }
        .edgesIgnoringSafeArea(.top) // Ignore safe area to cover the status bar
    }
}

    struct CardView: View {
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
}

// Helper extension to use hex color
