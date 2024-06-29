//
//  MaintenanceLog.swift
//  quoin-ios-app
//
//  Created by Chavez King on 11/06/2024.
//

import Foundation




import SwiftUI

struct MaintenanceLog: View {
    @State private var isMaintenanceModalModalView = false
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
                        
                        VStack {
                            Text("Maintenance Log")
                                .font(.title3)
                                .multilineTextAlignment(.center) // Align text in center
                                .foregroundColor(.black)
                                .padding(.horizontal) // Add padding for centering
                                .fontWeight(.bold)

                            
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
                    .padding(.top, 20)
                    .padding(.horizontal)
                    
                    Image("Maintenance")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .foregroundColor(.gray)
                        .padding()


                    VStack(alignment: .leading, spacing: 5) {
//                        HStack {
//                            Text("Maintenance Log")
//                                .font(.title3)
//                                .padding(.leading, 20)
//                                .fontWeight(.bold)
//
//                            Spacer()
//
//                            Button(action: {
//                                // Add action for the "see all" button
//                            }) {
//                                Text("See All")
//                                    .foregroundColor(.blue)
//                                    .padding(.trailing, 20)
//                                    .fontWeight(.bold)
//                            }
//                        }
//                        .padding(.bottom, 5)

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
                                    Text("Open")
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
                                    Text("Closed")
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
                                    selectedTerm = "Open"
                                    isMaintenanceModalModalView.toggle()
                                }) {
                                    MaintenaceCardView(propertyName: "Door Entry  \(index + 1)",
                                                    propertyAddress: "April 13, 2024",
                                                    rent: "£1000.00",
                                                    term: "Open",
                                                    paid: "")
                                    .padding(.horizontal, 15)
                                    .padding(.top, 10)
                                    
                                }
                            }
                        }
                        VStack {
                            ForEach(0..<3) { index in
                                Button(action: {
                                    selectedTerm = "Closed"
                                    isMaintenanceModalModalView.toggle()
                                }) {
                                    MaintenaceCardView(propertyName: "Lewis Flat \(index + 1)",
                                                    propertyAddress: "Expected 9th April 24",
                                                    rent: "£870",
                                                    term: "Closed",
                                                    paid: "")
                                    .padding(.horizontal, 15)
                                    .padding(.top, 10)
                                }
                            }
                        }
                    }
                }
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
                .sheet(isPresented: $isMaintenanceModalModalView) {
                    MaintenceModalView(term: selectedTerm)
                        .presentationDetents([.fraction(1)]) // Open modal to half screen
                }
            }
        }
    }
}





struct MaintenaceCardView: View {
    var propertyName: String
    var propertyAddress: String
    var rent: String
    var term: String
    var paid: String

    var body: some View {
        VStack {
            HStack {
                VStack {
                    Image("TerracedHouse")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50) // Set the frame size
                        .clipShape(RoundedRectangle(cornerRadius: 5)) // Add rounded corners
                        .padding(.bottom, -2)
                        .padding(.trailing, 10)
                }
                .padding(.trailing, 5)

                VStack(alignment: .leading) {
                    Text(propertyName)
                        .font(.headline)
                        .truncationMode(.tail)
                        .lineLimit(1)
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
                        .foregroundColor(term == "Closed" ? .red : .green)
                }
            }
            .padding()
            .background(Color.white)
            .foregroundColor(.black)
            //        .cornerRadius(15)
            //        .shadow(radius: 5)
            Divider() // Add the divider at the bottom of each card
        }
    }
}





struct MaintenceModalView: View {
    var term: String

    var body: some View {
        VStack {

            Capsule()
                .frame(width: 40, height: 5)
                .foregroundColor(.gray)
                .padding(.top, 40)

            Text("1 Canary Wharf")
                .font(.body)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            Divider()
            
            

            // Profile Image
            VStack {
                
                VStack {
                    HStack {
                        Text("Before")
                            .padding(.leading)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width - 40, height: 200) // Adjust width as needed
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                }
            }

            // Profile Information
            VStack(alignment: .center, spacing: 5) {
                VStack(alignment: .leading, spacing: 5) {
                    InfoSection(title: "Description", imageName: "exclamationmark.triangle.fill", color: .black, text: "This is a description of the issue, 11:35 a.m.")
                    InfoSection(title: "Reported Date", imageName: "calendar", color: .blue, text: "April 13, 2024, 11:35 a.m.")
                    InfoSection(title: "Contractor", imageName: "wrench.and.screwdriver", color: .orange, text: "Plumbing Ltd")
                    InfoSection(title: "Resolution Date", imageName: "calendar.badge.checkmark", color: .green, text: "April 13, 2024, 11:43 a.m.")
                    InfoSection(title: "Cost", imageName: "dollarsign.circle", color: .purple, text: "£1000.00")
                    InfoSection(title: "Status", imageName: "checkmark.circle.fill", color: .green, text: "Closed")
                }
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



#Preview {
    MaintenanceLog()
}
