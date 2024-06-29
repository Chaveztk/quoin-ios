import SwiftUI

struct NewsFeedView: View {
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
                            
//                            VStack {
//                                Text("Announcements")
//                                    .font(.headline)
//                                    .multilineTextAlignment(.center) // Align text in center
//                                    .padding(.horizontal) // Add padding for centering
//
//                                
//                            }
//                            .frame(maxWidth: .infinity) // Ensure VStack takes full width

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
                        
                        

                        VStack(alignment: .leading) {
                                // Announcement Start
                                VStack {
                                    NewsFeedMainCardView(
                                    title: "Latest Article",
                                    heading: "Government scraps the requirement all new private rental properties to have an EPC",
                                    date: "June 1st, 2024 • 3 min read ",
                                    imageName: "Landlords", // Ensure this image exists in your assets
                                    announcement: ""
                                    
                                        )
                            }
                            Divider()

                        }
                        
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
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("More Articles")
                                .font(.title3)
                                .fontWeight(.bold)
                                .padding(.leading, 20)
                                .padding(.bottom, 10)

                            // Search bar
                            

                            // Property cards
                            VStack {
                                ForEach(0..<3) { index in
                                    NewsFeedCardView(
                                        image: "EPC",
                                        heading: "Keeping track with your tenants \(index + 1)",
                                            subheading: "June 1st, 2024 • 3 min read ")
                                        .padding(.horizontal, 15)
                                        .padding(.top, 10)
                                }
                            }
                        }
                        .padding(.top, 20)
                    }
                }
                // Side bar goes here
            }
            .navigationBarHidden(true)
        }
    }
}


struct NewsFeedCardView: View {
    var image: String
    var heading: String
    var subheading: String
    

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 90, height: 60) // Set the frame size
                    .clipShape(RoundedRectangle(cornerRadius: 10)) // Add rounded corners
                    .padding(.bottom, -2)
                    .padding(.trailing, 10)

                VStack(alignment: .leading, spacing: 2) {
                    Text(heading)
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .fontWeight(.bold)

                    Text(subheading)
                        .font(.footnote)
                        .foregroundColor(.black)
                    
                }

                Spacer()
                Text("")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 5)
        }
        .padding()
    }
}




//struct NewsFeedCardView: View {
//    var image: String
//    var heading: String
//    var subheading: String
////    var icon: String
////    var footnoteText: String
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            // Footnote text and icon above the heading
//            HStack {
//                Image(systemName: "star.fill")
//                    .resizable()
//                    .frame(width: 10, height: 10) // Adjust the size of the icon
//                    .foregroundColor(.gray)
//                Text("Quoin Estates Management")
//                    .font(.footnote)
//                    .foregroundColor(.gray)
//                Spacer()
//            }
//            .padding(.bottom, 2)
//            
//            // Heading above the image
//            Text(heading)
//                .font(.subheadline)
//                .foregroundColor(.black)
//                .fontWeight(.bold)
//                .padding(.bottom, 5)
//                .lineLimit(2) // Limit lines to 3
//
//            
//            HStack {
//                Image(image)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 90, height: 60) // Set the frame size
//                    .clipShape(RoundedRectangle(cornerRadius: 10)) // Add rounded corners
//                    .padding(.trailing, 10)
//
//                VStack(alignment: .leading, spacing: 2) {
//                    Text(subheading)
//                        .font(.footnote)
//                        .foregroundColor(.black)
//                        .lineLimit(3) // Limit lines to 3
//                }
//
//                Spacer()
//            }
//            .padding(.bottom, 5)
//            
//            Divider() // Add a divider
//            
//            HStack {
//                Text("11 minutes ago")
//                    .font(.footnote)
//                    .foregroundColor(.gray)
//                Spacer()
//                Image(systemName: "ellipsis") // 3-dot icon
//                    .foregroundColor(.gray)
//            }
//        }
//        .padding()
//        .background(Color.white) // Card background
//        .cornerRadius(10) // Rounded corners for the card
//        .shadow(radius: 5) // Shadow for a card-like appearance
//    }
//}




struct NewsFeedMainCardView: View {
    var title: String
    var heading: String
    var date: String
    var imageName: String
    var announcement: String

    var body: some View {
        VStack(alignment: .leading) {  // Wrap everything in a VStack to structure the layout correctly
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding([.leading, .trailing])

            ZStack {
                // Background with shadow
                // RoundedRectangle(cornerRadius: 50)
                //    .fill(Color.white)

                // Image with rounded corners
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 20)) // Add border radius
                    .shadow(radius: 10)
            }
            .padding()
            .padding(.top, 10)
            .frame(maxWidth: .infinity)
            .padding(.bottom, 10)

            HStack {
                VStack(alignment: .leading) {
                    Text(heading)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding([.leading, .trailing])
                        .lineLimit(nil) // Allows the heading to span multiple lines
                        .padding(.bottom, 3)

                    Text(date)
                        .font(.footnote)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .padding([.leading, .trailing])

                }
                Spacer()
            }
            .padding(.top, 10)
            .padding(.bottom, 1)

            VStack(alignment: .leading) {
                // Announcement Text start
                Text(announcement)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading) // Align text to the leading edge
                    .padding(.horizontal)
                    .padding(.bottom, 0) // Adjusted spacing here

                // Announcement Text end
//                HStack(spacing: 4) {
//                    Spacer()
//                    Image(systemName: "sparkles") // Use a system image or replace with appropriate image name
//                        .font(.system(size: 20)) // Increased icon size
//                        .padding(.trailing, -4) // Added padding to the right
//                    Image(systemName: "sparkles") // Use a system image or replace with appropriate image name
//                        .font(.system(size: 20)) // Increased icon size
//                        .padding(.trailing, 20) // Added padding to the right
//                }
//                .padding(.bottom, 20)
            }
            .foregroundColor(.black)
        } // Close the VStack
    }
}


#Preview {
    NewsFeedView()
}
