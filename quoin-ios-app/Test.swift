//
//import SwiftUI
//
//struct HomeView: View {
//    var isAdmin: Bool = false
//    var isTenant: Bool = false
//    var isLandlord: Bool = false
//    var isDirector: Bool = false
//    var username: String = ""
//    @State private var isBellModalVisible = false // State for bell modal
//
//    @State private var searchText = ""
//    @State private var activeButton: Int? = nil // State to track the active button
//    @State private var selectedSection: String? = "Properties" // State to track the selected section
//    //    @State private var isSidebarOpen = false // State variable to control sidebar
//    
//    
//    var body: some View {
//            
//            NavigationStack {
//                ZStack {
//                    Background()
//                    
//                    ScrollView(.vertical) {
//                        VStack {
//                            // Top header with Hamburger Menu and Welcome
//                            HStack {
//                                //
//                                
//                                Button(action: {
//                                    // Add action for the hamburger menu
//                                }) {
//                                    
//                                    Image("ProfilePhoto")
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fill)
//                                        .cornerRadius(100) // Apply corner radius to the ZStack
//                                    
//                                        .frame(width: 40, height: 40)
//                                        .clipShape(Circle())
//                                    
//                                    
//                                        .padding(.leading, 0)
//                                    
//                                    //                                                    Image(systemName: "person.crop.circle.fill")
//                                    //                                                        .font(.system(size: 35)) // Adjust the font size as needed
//                                    //                                                        .foregroundColor(.black)
//                                    
//
//                                .padding(.leading, 0)
//                                
//                                    VStack(alignment: .leading, spacing: 0) {
//                                        Text(Greetings())
//                                            .foregroundStyle(.black)
//                                            .font(.headline)
//                                        Text("username")
////                                        Text(username)
//                                            .font(.subheadline)
//                                            .foregroundColor(.gray)
//                                            .padding(.leading, 4)
//                                    }
//                                }
//                                
//                                    .padding(.leading, -3)
//                                    
//                                    Spacer()
//                                    
//                                    // Profile Icon
////                                    NavigationLink(destination: UpcomingView()) {
////
////                                        Image(systemName: "line.horizontal.3")
////                                            .font(.title)
////                                            .foregroundColor(.black)
////                                    }
////                                    .padding(.trailing, 3)
//                                    
//                                    Button(action: {
//                                        isBellModalVisible.toggle() // Toggle bell modal visibility
//                                    }) {
//                                        Image(systemName: "bell")
//                                            .font(.title)
//                                            .foregroundColor(.black)
//                                    }
//                                    .padding(.trailing, 0)
//                                    
//                                
//                                }
//                                .padding(.top, 10)
//                                .padding(.horizontal)
//                            
//                            
//                            NavigationLink(destination: AnnouncementsView()) {
//                                
//                                VStack(alignment: .leading) {
//                                    // Announcement Start
//                                    VStack {
//                                        AnnouncementCardView(
//                                            title: "Announcement:",
//                                            heading: "Community Welcomes New Shop",
//                                            date: "Mon, 1st June, 19:00",
//                                            imageName: "ShopOpening", // Ensure this image exists in your assets
//                                            announcement: "Excitement buzzed through the community as the doors of a new shop swung open for the first time. Its vibrant signage beckoned passersby with promises of unique wares and friendly service. Local residents streamed in, eager to explore the shelves stocked with handcrafted goods and locally sourced treasures. The shop's grand opening marked a new chapter in the neighborhood, fostering a sense of community pride and support for small businesses. "
//                                        )
//                                    }
//                                    .lineLimit(3)
//                                }
//                            }
//                            .padding(.top, 10)
//                            Spacer()
//                        
//                    
//                            
//                            
//                            // Random image and text underneath
//                            VStack {
//                                
//                                // Buttin in a row start
//                                
//                                VStack {
//                                    ButtonRow(selectedSection: Binding(
//                                        get: { selectedSection ?? "Properties" }, // Default to "Properties" if nil
//                                        set: { selectedSection = $0 }
//                                    ), buttons: ["Properties", "Block", "Maintenance", "Up Coming"], colorHex: "#F5F5F")
//                                    
//                                    
//                                    if selectedSection == "Properties" {
//                                        VStack(alignment: .leading, spacing: 10) {
//                                            HStack {
//                                                Text("Properties")
//                                                    .font(.headline)
//                                                    .fontWeight(.bold)
//                                                    .padding(.top, 10)
//                                                    .padding(.bottom, -20)
//                                                    .padding(.leading)
//                                                
//                                                Spacer()
//                                                
//                                                Button(action: {
//                                                    // Add action for View All button
//                                                }) {
//                                                    Text("View all")
//                                                        .font(.subheadline)
//                                                        .fontWeight(.bold)
//                                                        .foregroundColor(.blue)
//                                                        .padding(.top, 10)
//                                                        .padding(.bottom, -20)
//                                                        .padding(.trailing, 20) // Added padding to the right
//                                                }
//                                            }
//                                            
//                        // Carousel of 4 cards start
//                        
//                        TabView {
//                            ForEach(0..<3) { index in
//                                NavigationLink(destination: PropertyView()) {
//                                    CardView {
//                                        VStack(alignment: .leading) {
//                                            HStack {
//                                                
//                                                
//                                                Image("TerracedHouse")
//                                                    .resizable()
//                                                    .aspectRatio(contentMode: .fill)
//                                                    .frame(width: 50, height: 50) // Set the frame size
//                                                    .clipShape(RoundedRectangle(cornerRadius: 5)) // Add rounded corners
//                                                    .padding(.bottom, -2)
//                                                    .padding(.trailing, 10)
//
//                                                
////                                                Image(systemName: )
////                                                    .resizable()
////                                                    .frame(width: 40, height: 40)
////                                                    .foregroundColor(.black)
////                                                    .clipShape(Circle())
////                                                    .padding(.trailing, 10)
//                                                Text("1 Canary Wharf")
//                                                    .font(.subheadline)
//                                                    .foregroundColor(.black)
//                                                    .fontWeight(.bold)
//                                                Spacer()
//                                                Text("Mar 23, 2024 ")
//                                                    .font(.subheadline)
//                                                    .foregroundColor(.gray)
//                                            }
//                                            .padding(.bottom, 5)
//                                        }
//                                        .padding()
//                                    }
//                                    .tag(index)
//                                }
//                            }
//                        }
//                        
//                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
//                        .frame(height: UIScreen.main.bounds.width * 0.4)
//                        
//                        // Carousel of 3 cards end
//                                        }
//                                        //                                    .background(Color.gray.opacity(0.1))
//                                        //                                    .cornerRadius(8)
//                                        //                                    .padding(.horizontal)
//                                        .transition(.opacity)
//                                    }
//                                    
//                                    if selectedSection == "Maintenance" {
//                                        VStack(alignment: .leading, spacing: 5) {
//                                            Text("Block content goes here")
//                                        }
//                                        .padding()
//                                        .background(Color.gray.opacity(0.1))
//                                        .cornerRadius(8)
//                                        .padding(.horizontal)
//                                        .transition(.opacity)
//                                    }
//                                    
//                                    if selectedSection == "Block" {
//                                        VStack(alignment: .leading, spacing: 5) {
//                                            HStack {
//                                                Image(systemName: "exclamationmark.triangle.fill")
//                                                    .foregroundColor(.yellow)
//                                                    .padding(.trailing, 5)
//                                                Text("No information to display")
//                                            }
//                                        }
//                                        .padding()
//                                        .background(Color.gray.opacity(0.1))
//                                        .cornerRadius(8)
//                                        .padding(.horizontal)
//                                        .transition(.opacity)
//                                    }
//                                    
//                                    if selectedSection == "Up Coming" {
//                                        VStack(alignment: .leading, spacing: 10) {
//                                            Text("Up coming content here")
//                                                .padding()
//                                        }
//                                        .background(Color.gray.opacity(0.1))
//                                        .cornerRadius(8)
//                                        .padding(.horizontal)
//                                        .transition(.opacity)
//                                    }
//                                    
//                                    
//                                    
//                                    
////                                        HStack {
////                                            Text("Upcoming")
////                                                .font(.headline)
////                                                .fontWeight(.bold)
////                                                .padding(.top, 10)
////                                                .padding(.bottom, -20)
////                                                .padding(.leading)
////
////                                            Spacer()
////
////                                            Button(action: {
////                                                // Add action for View All button
////                                            }) {
////                                                Text("View all")
////                                                    .font(.subheadline)
////                                                    .fontWeight(.bold)
////                                                    .foregroundColor(.blue)
////                                                    .padding(.top, 10)
////                                                    .padding(.bottom, -20)
////                                                    .padding(.trailing, 20) // Added padding to the right
////                                            }
////        //                                    .padding()
////                                        }
////
////                                        ScrollView(.horizontal, showsIndicators: false) {
////                                            HStack(spacing: 20) { // Adjust spacing between cards as needed
////                                                ForEach(0..<3) { _ in // Repeat the content horizontally
////                                                    VStack {
////                                                        HStack {
////                                                            CardView {
////                                                                UpcomingCardView()
////                                                            }
////                                                        }
////                                                    }
////                                                }
////                                            }
////                                            .padding()
////                                        }
//                                    
//                                    
//                                    
//
//                                    
//                                    HStack {
//                                        Text("Categories")
//                                            .font(.headline)
//                                            .fontWeight(.bold)
//                                            .padding(.top, 10)
//                                            .padding(.bottom, -20)
//                                            .padding(.leading)
//                                        
//                                        Spacer()
//                                        
//                                        Button(action: {
//                                            // Add action for View All button
//                                        }) {
//                                            Text("View all")
//                                                .font(.subheadline)
//                                                .foregroundColor(.blue)
//                                                .fontWeight(.bold)
//                                                .padding(.top, 10)
//                                                .padding(.bottom, -20)
//                                                .padding(.trailing, 20) // Added padding to the right
//                                        }
//                                    }
//                                    .padding(.bottom, 20)
//                                }
//                            }
//                        }
//                        .padding(.bottom, 0)
//                        
//                        // Cards for Event Schedule, Profile Info, Documents, Announcements start
//                        VStack(spacing: 30) { // Add spacing between vertical stacks
//                                    HStack(spacing: 40) { // Add spacing between horizontal stacks
//                                        NavigationLink(destination: ArchiveView()) {
//                                            FourCardView(
//                                                heading: "Event Schedule",
//                                                imageName: "calendar"
//                                            )
//                                        }
//                                        NavigationLink(destination: ProfileView()) {
//                                            FourCardView(
//                                                heading: "Profile Info",
//                                                imageName: "person.circle.fill"
//                                            )
//                                        }
//                                    }
//                                    HStack(spacing: 40) { // Add spacing between horizontal stacks
//                                        NavigationLink(destination: DocumentView()) {
//                                            FourCardView(
//                                                heading: "Documents",
//                                                imageName: "doc.fill"
//                                            )
//                                        }
//                                        NavigationLink(destination: DirectorMemberlogView()) {
//                                            FourCardView(
//                                                heading: "Member log",
//                                                imageName: "megaphone.fill"
//                                            )
//                                        }
//                                    
//                                }
//                                
//                        }
//                        .padding(.horizontal)
//                        .padding(.vertical)
//                        
//                        // Cards for Event Schedule, Profile Info, Documents, Announcements end
//                    }
//                    
//                    VStack {
//                        Spacer()
//                        HStack {
//                            Spacer()
//                            NavBarButton(iconName: "house.fill", buttonText: "Home")
//                            Spacer()
//                            NavBarButton(iconName: "magnifyingglass", buttonText: "Search")
//                            Spacer()
//                            NavBarButton(iconName: "bell.fill", buttonText: "Uo coming")
//                            Spacer()
//                            NavBarButton(iconName: "calendar", buttonText: "Schedule")
//                            Spacer()
//                        }
//                        .padding(.top, 15)
//                        .background(Color.white)
//                        .shadow(radius: 10)
//                        .padding(.bottom, -20)
//                    }
//                }
//                .sheet(isPresented: $isBellModalVisible) {
//                    BellModalView()
//                        .presentationDetents([.fraction(0.9)]) // Open modal to half screen
//                }
//                .navigationBarHidden(true) // Hide the navigation bar to show the hamburger menu instead
//            }
//        }
//    }
//
//
//
//struct FourCardView: View {
//    var heading: String
//    var imageName: String
//    
//    var body: some View {
//        
//        VStack {
//            Image(systemName: imageName)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 30, height: 30)
//                .padding()
//                .foregroundColor(.black)
//            Text(heading)
//                .font(.headline)
//                .padding(.bottom, 10)
//                .foregroundColor(.black)
//        }
//        .frame(width: 150, height: 120)
//        .background(Color.white)
//        .cornerRadius(10)
//        .shadow(radius: 5)
//        
//    }
//}
//
//
//struct TestCardView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "megaphone.fill")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 30, height: 30)
//                .padding()
//                .foregroundColor(.black)
//            Text("Member log")
//                .font(.headline)
//                .padding(.bottom, 10)
//                .foregroundColor(.black)
//        }
//        .frame(width: 150, height: 120)
//        .background(Color.white)
//        .cornerRadius(10)
//        .shadow(radius: 5)
//    }
//}
//
//struct PropertyCardView: View {
//    var propertyName: String
//    var propertyAddress: String
//    
//    var body: some View {
//        HStack {
//            Image(systemName: "house.fill")
//                .resizable()
//                .frame(width: 40, height: 40)
//                .clipShape(Circle())
//                .padding(.trailing, 10)
//            
//            VStack(alignment: .leading) {
//                Text(propertyName)
//                    .font(.headline)
//                Text(propertyAddress)
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//            }
//        }
//        .padding()
//        .background(Color.white)
//        .cornerRadius(10)
//        .shadow(radius: 5)
//    }
//}
//
//
//
//
//
////struct UpcomingCardView: View {
////    var body: some View {
////        VStack {
////            AsyncImage(url: URL(string: "https://www.bankrate.com/2022/08/04093343/Buying-a-house-with-an-LLC.jpg?auto=webp&optimize=high&crop=16:9&width=912")) { image in
////                image
////                    .resizable()
////                    .aspectRatio(contentMode: .fit)
////                    .frame(width: 70, height: 70)
////                    .padding()
////                    .foregroundColor(.black)
////            } placeholder: {
////                ProgressView()
////            }
////            .frame(width: 50, height: 50)
////            .padding()
////            Text("Rent")
////                .font(.headline)
////                .padding(.bottom, 10)
////                .foregroundColor(.black)
////            Text("1 May")
////                .font(.headline)
////                .padding(.bottom, 10)
////                .foregroundColor(.black)
////            Text("£1000")
////                .font(.body)
////                .padding(.bottom, 10)
////                .foregroundColor(.black)
////        }
////        .frame(width: 150, height: 200)
////        .background(Color.white)
////        .cornerRadius(10)
////        .shadow(radius: 5)
////    }
////}
//
//
//
//
//
//
//
////struct UpcomingCardView: View {
////    var body: some View {
////        CardView {
////            HStack {
////                VStack(alignment: .leading, spacing: 5) {
////                    HStack {
////                        Image(systemName: "calendar")
////                            .resizable()
////                            .frame(width: 30, height: 30)
////                            .foregroundColor(.blue)
////                        Text("Event Date: June 15, 2024")
////                            .font(.subheadline)
////                            .foregroundColor(.gray)
////                    }
////                    Text("From upcoming page")
////                        .font(.subheadline)
////                        .foregroundColor(.black)
////                }
////                Spacer()
////            }
////        }
////        .frame(width: 180, height: 150) // Adjust the size of the card as needed
////        .cornerRadius(15) // Adjust the corner radius to make it more squared
////    }
////}
//
//
//
//
//
//#Preview {
//    HomeView()
//}
//
//
//
//
//
//
