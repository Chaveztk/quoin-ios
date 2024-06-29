import SwiftUI

struct AnnouncementsView: View {
    @State private var searchText = ""

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
                                    title: "Latest Announcement:",
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
                        
                        VStack {
                            ForEach(0..<3) { index in
                                    AnnouncementLogCardView(image: "EPC",
                                    heading: "The latest Announcement updated here.",
                                    subheading: "Excitement buzzed through the community as the doors of a new shop swung open for the first time. Its vibrant signage beckoned passersby with promises of unique wares and friendly service.")
                                    .padding(.horizontal, 15)
                                    .padding(.top, 10)
                            }
                        }
                    }
                    }
                }
                // Side bar goes here
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    AnnouncementsView()
}
