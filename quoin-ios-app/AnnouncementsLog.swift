//
//  AnnouncementsLog.swift
//  quoin-ios-app
//
//  Created by Chavez King on 17/06/2024.
//

import Foundation


import SwiftUI

struct AnnouncementsLogView: View {
    @State private var searchText = ""
    @State private var selectedTerm: String = "" // State for storing the selected term

    var body: some View {
        NavigationView {
            ZStack(alignment: .leading) { // Align the sidebar to the leading edge
                Background()

                ScrollView(.vertical) {
                    VStack {
                        // Top header with Hamburger Menu and Welcome
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
                                Text("Announcements")
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
    //                            Image(systemName: "line.horizontal.3")
    //                                .font(.title)
    //                                .foregroundColor(.black)
    //                        }
    //                        .padding(.trailing, 20)
                        }
                        .padding(.horizontal)
                        .padding(.top, 20)
                        .padding(.horizontal)

                        VStack(alignment: .leading) {
                            // Announcement Start
                            VStack {
                                AnnouncementCardView(
                                    title: "Announcement:",
                                    heading: "Community Welcomes New Shop with Open Arms",
                                    date: "Mon, 1st June • 19:00",
                                    imageName: "ShopOpening", // Ensure this image exists in your assets
                                    announcement: "Excitement buzzed through the community as the doors of a new shop swung open for the first time. Its vibrant signage beckoned passersby with promises of unique wares and friendly service. Local residents streamed in, eager to explore the shelves stocked with handcrafted goods and locally sourced treasures. The shop's grand opening marked a new chapter in the neighborhood, fostering a sense of community pride and support for small businesses. "
                                    
                                )
                            }
                            
                            Spacer()
                            
                            
                            Text("Previous Announcements")
                                .font(.headline)
                                .padding(.leading, 15)
                                .padding(.bottom, 25)
                            HStack {
                                TextField("Search Articles", text: $searchText)
                                    .padding(.vertical, 10) // Increase vertical padding
                                    .padding(.horizontal, 15) // Increase horizontal padding
                                    .background(Color.white) // Optional: Set background color
                                    .cornerRadius(10) // Apply corner radius for rounded corners
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray, lineWidth: 1) // Optional: Add border
                                    )
                                        
                                Image(systemName: "magnifyingglass")
                                    .padding(12) // Add padding to match the text field box
                                    .background(Color.black)
                                    .cornerRadius(10) // Apply corner radius for rounded corners
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 5) // Adjust spacing between text field and icon
                                    }
                                    .padding(.horizontal, 20)
    //                                .padding(.bottom, 60)
    //                                .padding(.top, 50)

//                            VStack {
//                                ForEach(0..<3) { index in
//                                    Button(action: {
//                                        //                                    selectedTerm = "Open"
//                                    }) {
//                                        AnnouncementLogCardView(propertyName: "This coming Spring  \(index + 1)",
//                                                                propertyAddress: "Thurs, 13th April, 2024",
//                                                                text: "Excitement buzzed through the community as the doors of a new shop swung open for the first time. Its vibrant signage beckoned passersby with promises of unique wares and friendly service.",
//                                                                rent: "",
//                                                                image: "paperclip",
//                                                                imageNumber: "3",
//                                                                paid: "")
//                                        .padding(.horizontal, 15)
//                                        .padding(.top, 10)
//                                        
//                                    }
//                                }
//                            }
                        }
                    }
                }
                // Side bar goes here
            }
            .navigationBarHidden(true)
        }
    }
}




//struct AnnouncementLogCardView: View {
//    var propertyName: String
//    var propertyAddress: String
//    var text: String
//    var rent: String
//    var image: String
//    var imageNumber: String
//    var paid: String
//
//    var body: some View {
//        VStack {
//            HStack {
////                VStack {
////                    Image("")
////                        .resizable()
////                        .aspectRatio(contentMode: .fill)
////                        .frame(width: 50, height: 50) // Set the frame size
////                        .clipShape(RoundedRectangle(cornerRadius: 5)) // Add rounded corners
////                        .padding(.bottom, -2)
////                        .padding(.trailing, 10)
////                }
////                .padding(.trailing, 5)
//
//                VStack(alignment: .leading) {
//                    Text(propertyName)
//                        .font(.headline)
//                        .truncationMode(.tail)
//                        .lineLimit(1)
//                    Text(propertyAddress)
//                        .font(.subheadline)
//                        .foregroundColor(.gray)
//                        .truncationMode(.tail)
//                        .lineLimit(1)
//                    Text(text)
//                        .font(.subheadline)
//                        .foregroundColor(.gray)
//                        .truncationMode(.tail)
//                        .lineLimit(3)
//                }
//                Spacer()
//                VStack(alignment: .trailing) {
//                    Text(rent)
//                        .font(.subheadline)
//                        .fontWeight(.bold)
//                    HStack(spacing: 1) {
//                        Text(imageNumber)
//                            .font(.subheadline)
//                            .fontWeight(.bold)
//                        Image(systemName: image)
//                            .font(.footnote)
//                            .fontWeight(.bold)
//                    }
//                    .foregroundColor(.gray)
//
//                    HStack(spacing: -10) {
////                        Spacer()
//                        Image("ProfilePhoto") // Use a system image or replace with appropriate image name
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .font(.system(size: 20)) // Increased icon size
//                            .clipShape(RoundedRectangle(cornerRadius: 5)) // Add rounded corners
//                            .frame(width: 25, height: 25) // Set the frame size
//                            .clipShape(Circle())
//
//                        Image("ProfileImage") // Use a system image or replace with appropriate image name
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .font(.system(size: 20)) // Increased icon size
//                            .padding(.trailing, -10) // Added padding to the right
//                            .clipShape(RoundedRectangle(cornerRadius: 5)) // Add rounded corners
//                            .frame(width: 25, height: 25) // Set the frame size
//                            .clipShape(Circle())
//
//                    }
//
//                    .padding(.bottom, 10)
//                    .padding(.top, 4)
//                }
//            }
////            .padding()
////            .background(Color.white)
//            .foregroundColor(.black)
////                    .cornerRadius(15)
////                    .shadow(radius: 5)
//            Divider() // Add the divider at the bottom of each card
//        }
//    }
//}





struct AnnouncementLogCardView: View {
    var image: String
    var heading: String
    var subheading: String
//    var icon: String
//    var footnoteText: String

    var body: some View {
        VStack(alignment: .leading) {
            // Footnote text and icon above the heading
            HStack {
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 10, height: 10) // Adjust the size of the icon
                    .foregroundColor(.gray)
                Text("Quoin Estates Management")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .fontWeight(.bold)

                Spacer()
            }
            .padding(.bottom, 2)
            
            // Heading above the image
            Text(heading)
                .font(.subheadline)
                .foregroundColor(.black)
                .fontWeight(.bold)
                .padding(.bottom, 1)
                .lineLimit(2) // Limit lines to 3

            
            HStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 90, height: 60) // Set the frame size
                    .clipShape(RoundedRectangle(cornerRadius: 10)) // Add rounded corners
                    .padding(.trailing, 5)

                VStack(alignment: .leading, spacing: 2) {
                    Text(subheading)
                        .font(.footnote)
                        .foregroundColor(.black)
                        .lineLimit(3) // Limit lines to 3
//                        .fixedSize(horizontal: false, vertical: true) // Ensure the text wraps properly

                }

                Spacer()
            }
            .padding(.bottom, 5)
            
            Divider() // Add a divider
            
            HStack {
                Text("Mon, 1st June • 19:00")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: "ellipsis") // 3-dot icon
                    .foregroundColor(.gray)
            }
//            .padding(.top, 2)

        }
        .padding()
        .background(Color.white) // Card background
        .cornerRadius(10) // Rounded corners for the card
        .shadow(radius: 5) // Shadow for a card-like appearance
    }
}

#Preview {
    AnnouncementsLogView()
}
