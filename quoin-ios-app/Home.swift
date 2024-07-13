
import SwiftUI

struct HomeView: View {
    @AppStorage("username") private var username: String = ""
    @AppStorage("isAdmin") private var isAdmin: Bool = false
    @AppStorage("isLandlord") private var isLandlord: Bool = false
    @AppStorage("isTenant") private var isTenant: Bool = false
    @AppStorage("isDirector") private var isDirector: Bool = false
    @State private var tenancies: [(Tenancy, String)] = []
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var isBellModalVisible = false // State for bell modal
    @State private var isLoading: Bool = true
    @State private var searchText = ""
    @State private var activeButton: Int? = nil // State to track the active button
    @State private var selectedSection: String? = "Up Coming" // State to track the selected section
    //    @State private var isSidebarOpen = false // State variable to control sidebar
    @State private var showMenu = false // State for showing side menu
    @State private var selectedTab = 0 // State for selected tab
    
    @State private var bookings: [Date: [Event]] = [
        Calendar.current.date(from: DateComponents(year: 2024, month: 7, day: 10))!: [
            Event(title: "Doctor appointment", time: "10:30am - 11:30am", color: .red, date: Calendar.current.date(from: DateComponents(year: 2024, month: 7, day: 3))!),
            Event(title: "Dentis appointment", time: "12:00pm - 1:00pm", color: .green, date: Calendar.current.date(from: DateComponents(year: 2024, month: 7, day: 3))!),
            Event(title: "Apple appointment", time: "7:00pm - 9:00pm", color: .orange, date: Calendar.current.date(from: DateComponents(year: 2024, month: 7, day: 3))!)
        ]
    ]
    
    
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Background()
                if isLoading {
                    Loading(isLoading: $isLoading, messageLoading: "Gathering data. Just a sec...")
                } else {
                    ScrollView(.vertical) {
                        VStack {
                            // Top header with Hamburger Menu and Welcome
                            HStack {
                                //
                                
                                Button(action: {
                                    // Add action for the hamburger menu
                                    withAnimation {
                                        showMenu.toggle()
                                    }
                                }) {
                                    
                                    //                                Image("ProfilePhoto")
                                    Image("ProfileImage")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .cornerRadius(100) // Apply corner radius to the ZStack
                                    
                                        .frame(width: 40, height: 40)
                                        .clipShape(Circle())
                                    
                                    
                                        .padding(.leading, 0)
                                    
                                    
                                        .padding(.leading, 0)
                                    
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text(Greetings())
                                            .foregroundStyle(.black)
                                            .font(.headline)
                                        //Text("James")
                                        Text(username)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                            .padding(.leading, 4)
                                    }
                                }
                                
                                .padding(.leading, -3)
                                
                                Spacer()
                                
                                //                            Profile Icon
                                //                            NavigationLink(destination: UpcomingView()) {
                                //
                                //                                Image(systemName: "line.horizontal.3")
                                //                                    .font(.title)
                                //                                    .foregroundColor(.black)
                                //                            }
                                //                            .padding(.trailing, 3)
                                //
                                Button(action: {
                                    isBellModalVisible.toggle() // Toggle bell modal visibility
                                }) {
                                    Image(systemName: "bell")
                                        .font(.title)
                                        .foregroundColor(.black)
                                    
                                }
                                .padding(.trailing, 0)
                                
                                
                            }
                            .padding(.top, 10)
                            .padding(.horizontal)
                            
                            
                            NavigationLink(destination: AnnouncementsView()) {
                                
                                VStack(alignment: .leading) {
                                    // Announcement Start
                                    VStack {
                                        AnnouncementCardView(
                                            title: "Announcement:",
                                            heading: "Community Welcomes New Shop",
                                            date: "Mon, 1st June, 19:00",
                                            imageName: "ShopOpening", // Ensure this image exists in your assets
                                            announcement: "Excitement buzzed through the community as the doors of a new shop swung open for the first time. Its vibrant signage beckoned passersby with promises of unique wares and friendly service. Local residents streamed in, eager to explore the shelves stocked with handcrafted goods and locally sourced treasures. The shop's grand opening marked a new chapter in the neighborhood, fostering a sense of community pride and support for small businesses. "
                                        )
                                    }
                                    .lineLimit(3)
                                }
                            }
                            .padding(.top, 10)
                            
                            
                            
                            
                            
                            
                            // Random image and text underneath
                            VStack {
                                
                                // Buttin in a row start
                                
                                VStack {
                                    
                                    HStack {
                                        Text("Today's Event")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .padding(.top, 10)
                                            .padding(.bottom, -20)
                                            .padding(.leading)
                                        
                                        Spacer()
                                    }
                                    .padding(.bottom, 30)
                                    .padding(.top, 10)
                                    HStack(spacing: 20) {
                                        //                                    WidgetCard(bookings: $bookings)
                                        WidgetCard(bookings: $bookings)
                                            .frame(width: 170, height: 150)
                                            .background(Color(UIColor.white))
                                            .cornerRadius(25)
                                        //                                        .shadow(radius: 5)
                                        WidgetCard(bookings: $bookings)
                                            .frame(width: 170, height: 150)
                                            .background(Color(UIColor.white))
                                            .cornerRadius(25)
                                        //                                        .shadow(radius: 5)
                                        
                                        //                                    ZStack {
                                        //                                        // Background image
                                        //                                        Image("Mews")
                                        //                                            .resizable()
                                        //                                            .aspectRatio(contentMode: .fill)
                                        //                                            .frame(width: 170, height: 150)
                                        //                                            .cornerRadius(25)
                                        //                                            .shadow(radius: 5)
                                        //
                                        //                                        // Text overlay
                                        //                                        Text("My Estate")
                                        //                                            .foregroundColor(.black) // Customize text color as needed
                                        //                                            .font(.headline) // Adjust font size and style
                                        //                                            .frame(width: 170, height: 150)
                                        //                                            .background(Color.white.opacity(0.3)) // Semi-transparent white background
                                        //                                            .cornerRadius(25)
                                        //                                            .shadow(radius: 5)
                                        //                                    }
                                        
                                    }
                                    
                                    
                                    //                                HStack(spacing: 20) {
                                    //                                    WidgetCard(bookings: $bookings)
                                    //                                        .frame(width: 170, height: 150)
                                    //                                        .background(Color(UIColor.white))
                                    //                                        .cornerRadius(25)
                                    //                                        .shadow(radius: 5)
                                    //                                    WidgetCard(bookings: $bookings)
                                    //                                        .frame(width: 170, height: 150)
                                    //                                        .background(Color(UIColor.white))
                                    //                                        .cornerRadius(25)
                                    //                                        .shadow(radius: 5)
                                    //                                }
                                    //                                .padding(.top, 20)
                                    //                                .padding(.bottom, 20)
                                    
                                    
                                    //                                HStack {
                                    ButtonRow(selectedSection: Binding(
                                        get: { selectedSection ?? "Properties" }, // Default to "Properties" if nil
                                        set: { selectedSection = $0 }
                                    ), buttons: ["Up Coming", "Live Maintenance", "Properties", ""], colorHex: "#F5F5F")
                                    //                                .padding(.horizontal, 40)
                                    .padding(.top, 5)
                                    //                            }
                                    //                            .background(Color(UIColor.white))
                                    //                            .padding(.top, 20)
                                    //                            .padding(.horizontal)
                                    //                            .cornerRadius(25)
                                    
                                    
                                    
                                    if selectedSection == "Properties" {
                                        VStack(alignment: .leading, spacing: 10) {
                                            HStack {
                                                Text("Properties")
                                                    .font(.headline)
                                                    .fontWeight(.bold)
                                                    .padding(.top, 5)
                                                    .padding(.bottom, -20)
                                                    .padding(.leading)
                                                
                                                Spacer()
                                                
                                                Button(action: {
                                                    // Add action for View All button
                                                }) {
                                                    Text("View all")
                                                        .font(.subheadline)
                                                        .fontWeight(.bold)
                                                        .foregroundColor(.blue)
                                                        .padding(.top, 5)
                                                        .padding(.bottom, -20)
                                                        .padding(.trailing, 20) // Added padding to the right
                                                }
                                            }
                                            
                                            // Carousel of 4 cards start
                                            
                                            TabView {
                                                ForEach(tenancies, id: \.0.pk) { tenancy, address in
                                                    NavigationLink(destination:PropertyView(tenancyId: tenancy.pk) //PropertyView()
                                                    ) {
                                                        CardView {
                                                            VStack(alignment: .leading) {
                                                                HStack {
                                                                    
                                                                    
                                                                    Image("TerracedHouse")
                                                                        .resizable()
                                                                        .aspectRatio(contentMode: .fill)
                                                                        .clipShape(Circle())
                                                                        .frame(width: 50, height: 50) // Set the frame size
                                                                    //                                                                    .clipShape(RoundedRectangle(cornerRadius: 5)) // Add rounded corners
                                                                        .padding(.bottom, -2)
                                                                        .padding(.trailing, 10)
                                                                    
                                                                    
                                                                    //                                                                Image(systemName: )
                                                                    //                                                                    .resizable()
                                                                    //                                                                    .frame(width: 40, height: 40)
                                                                    //                                                                    .foregroundColor(.black)
                                                                    //                                                                    .clipShape(Circle())
                                                                    //                                                                    .padding(.trailing, 10)
                                                                    Text(address)
                                                                        .font(.subheadline)
                                                                        .foregroundColor(.black)
                                                                        .fontWeight(.bold)
                                                                    Spacer()
                                                                    Text(tenancy.rent_pm_swift)
                                                                        .font(.subheadline)
                                                                        .foregroundColor(.gray)
                                                                }
                                                                .padding(.bottom, 5)
                                                            }
                                                            .padding()
                                                        }
                                                    }
                                                }
                                            }
                                            
                                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                                            .frame(height: UIScreen.main.bounds.width * 0.4)
                                            
                                            // Carousel of 3 cards end
                                        }
                                        //                                    .background(Color.gray.opacity(0.1))
                                        //                                    .cornerRadius(8)
                                        //                                    .padding(.horizontal)
                                        .transition(.opacity)
                                    }
                                    
                                    if selectedSection == "Live Maintenance" {
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text("Live Maintenance goes here")
                                        }
                                        .padding()
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(8)
                                        .padding(.horizontal)
                                        .transition(.opacity)
                                    }
                                    
                                    if selectedSection == "Block" {
                                        VStack(alignment: .leading, spacing: 5) {
                                            HStack {
                                                Image(systemName: "exclamationmark.triangle.fill")
                                                    .foregroundColor(.yellow)
                                                    .padding(.trailing, 5)
                                                Text("No information to display")
                                            }
                                        }
                                        .padding()
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(8)
                                        .padding(.horizontal)
                                        .transition(.opacity)
                                    }
                                    
                                    if selectedSection == "Up Coming" {
                                        // Upcoming start
                                        HStack {
                                            Text("Upcoming")
                                                .font(.headline)
                                                .fontWeight(.bold)
                                                .padding(.top, 10)
                                                .padding(.bottom, -20)
                                                .padding(.leading)
                                            
                                            Spacer()
                                            
                                            Button(action: {
                                                // Add action for View All button
                                            }) {
                                                Text("View all")
                                                    .font(.subheadline)
                                                    .foregroundColor(.blue)
                                                    .fontWeight(.bold)
                                                    .padding(.top, 10)
                                                    .padding(.bottom, -20)
                                                    .padding(.trailing, 20) // Added padding to the right
                                            }
                                        }
                                        .padding(.bottom, 30)
                                        .padding(.top, 10)
                                        
                                        
                                        // Upcoming start
                                        HStack(spacing: 20) { // Adjust spacing between cards as needed
                                            VStack {
                                                HStack {
                                                    VStack {
                                                        // Combining both UpcomingCardViews within a single card-like container
                                                        VStack(spacing: 0) { // Remove spacing between the cards
                                                            UpcomingCardView(
                                                                propertyName: "1 Canary Wharf", propertyAddress: "You have 2 days remaining to stay", rent: "£1000", term: "Hello",
                                                                month: "APR",
                                                                date: "10")
                                                            
                                                            UpcomingCardView(
                                                                propertyName: "1 Canary Wharf", propertyAddress: "You have 2 days remaining to stay", rent: "£1000", term: "Hello",
                                                                month: "APR",
                                                                date: "10")
                                                            
                                                        }
                                                        .padding(5) // Reduced padding inside the card
                                                        .background(Color.white) // Background color of the card
                                                        .cornerRadius(20) // Rounded corners for the card
                                                        .shadow(radius: 5) // Shadow for a card-like appearance
                                                    }
                                                    .padding(.horizontal, 15) // Reduced horizontal padding
                                                    .padding(.vertical, 5) // Reduced vertical padding
                                                    
                                                }
                                            }
                                        }
                                        //  Upcoming end
                                        
                                    }
                                    
                                    
                                    
                                    
                                    
                                }
                            }
                        }
                        .padding(.bottom, 0)
                        
                        
                        
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
                        .shadow(radius: 5)
                        
                        // Progress bar end
                        
                        
                        HStack {
                            Text("Categories")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding(.top, 10)
                                .padding(.bottom, -20)
                                .padding(.leading)
                            
                            Spacer()
                            
                            Button(action: {
                                // Add action for View All button
                            }) {
                                Text("")
                                    .font(.subheadline)
                                    .foregroundColor(.blue)
                                    .fontWeight(.bold)
                                    .padding(.top, 10)
                                    .padding(.bottom, -20)
                                    .padding(.trailing, 20) // Added padding to the right
                            }
                        }
                        .padding(.bottom, 20)
                        .padding(.top, 20)
                        
                        // Cards for Event Schedule, Profile Info, Documents, Announcements start
                        VStack(spacing: 20) { // Add spacing between vertical stacks
                            HStack(spacing: 20) { // Add spacing between horizontal stacks
                                NavigationLink(destination: PaymentHistoryView()) {
                                    FourCardView(
                                        //                                    heading: "Event Schedule",
                                        heading: "Payment History",
                                        imageName: "dollarsign.circle"
                                        //                                    imageName: "calendar"
                                    )
                                }
                                NavigationLink(destination: CalendarBookingView()) {
                                    FourCardView(
                                        heading: "Event Calendar",
                                        imageName: "calendar"
                                    )
                                }
                            }
                            .shadow(radius: 5)
                            
                            HStack(spacing: 20) { // Add spacing between horizontal stacks
                                NavigationLink(destination: DocumentView()) {
                                    FourCardView(
                                        heading: "Documents",
                                        imageName: "doc.text"
                                    )
                                }
                                NavigationLink(destination: DirectorMemberlogView()) {
                                    FourCardView(
                                        heading: "Member log",
                                        //                                    heading: "Invoice log",
                                        imageName: "doc.richtext"
                                    )
                                }
                                
                            }
                            .shadow(radius: 5)
                            
                            
                        }
                        .padding(.horizontal)
                        .padding(.vertical)
                        .padding(.bottom, 30)
                        
                        // Cards for Event Schedule, Profile Info, Documents, Announcements end
                    }
                    
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            NavigationLink(destination: DummyView()) {
                                NavBarButton(iconName: "house.fill", buttonText: "Home")
                            }
                            Spacer()
                            NavigationLink(destination: AnnouncementsView()) {
                                NavBarButton(iconName: "megaphone.fill", buttonText: "Announcements")
                            }
                            Spacer()
                            NavigationLink(destination: NewsFeedView()) {
                                NavBarButton(iconName: "newspaper.fill", buttonText: "News Feed")
                            }
                            Spacer()
                            NavigationLink(destination: ProfileView()) {
                                NavBarButton(iconName: "gearshape", buttonText: "Settings")
                            }
                            Spacer()
                        }
                        .padding(.top, 15)
                        .background(Color.white)
                        //                    .shadow(radius: 10)
                        .padding(.bottom, -15)
                        .foregroundStyle(.black)
                    }
                    
                    
                    //                VStack {
                    //                    Spacer() // This spacer pushes the HStack down
                    //                    HStack {
                    //                        Spacer()
                    //                        NavBarButton(iconName: "house.fill", buttonText: "Home")
                    //                            .padding(.vertical) // Add padding at the top and bottom
                    //                        Spacer()
                    //                        NavigationLink(destination: NewsFeedView()) {
                    //                            NavBarButton(iconName: "newspaper.fill", buttonText: "News Feed")
                    //                                .padding(.vertical) // Add padding at the top and bottom
                    //                        }
                    //                        Spacer()
                    //                        NavigationLink(destination: AnnouncementsView()) {
                    //                            NavBarButton(iconName: "megaphone.fill", buttonText: "Announcements")
                    //                                .padding(.vertical) // Add padding at the top and bottom
                    //                        }
                    //                        Spacer()
                    //                        NavigationLink(destination: ProfileView()) {
                    //                            NavBarButton(iconName: "person.crop.circle", buttonText: "Profile")
                    //                                .padding(.vertical) // Add padding at the top and bottom
                    //                        }
                    //                        Spacer()
                    //                    }
                    //                    .padding(.horizontal) // Add equal padding on each side
                    //                    .background(
                    //                        LinearGradient(
                    //                            gradient: Gradient(colors: [Color(hex: "#000000"), Color(hex: "#F5F5F")]),
                    //                            //                                Color(hex: "#575757")]),
                    //                            startPoint: .leading,
                    //                            endPoint: .trailing
                    //                        )
                    //                    )
                    //                    .cornerRadius(35) // Apply border radius
                    //                    .foregroundColor(.white) // Set text and image color to white
                    //                    .padding(.horizontal)
                    //                    .padding(.bottom, -40) // Bring the HStack closer to the bottom
                    //                }
                    //                .padding(.bottom, 20) // Bring the entire VStack closer to the bottom
                    .sheet(isPresented: $isBellModalVisible) {
                        BellModalView()
                            .presentationDetents([.fraction(0.9)]) // Open modal to half screen
                    }
                    
                    
                    // Side Menu
                    if showMenu {
                        GeometryReader { _ in
                            HStack {
                                SideMenuView(isShowing: $showMenu)
                                    .frame(width: UIScreen.main.bounds.width * 0.7)
                                    .transition(.move(edge: .leading))
                                Spacer()
                            }
                        }
                        .background(Color.black.opacity(0.5).onTapGesture {
                            withAnimation {
                                showMenu.toggle()
                            }
                        })
                        .edgesIgnoringSafeArea(.all)
                    }
                }
            }
            .onAppear {
                Task {
                    do {
                        var tenanciesList: [Tenancy]?
                        if isAdmin {
                            tenanciesList = try await fetchDataList(modelType: Tenancy.self, pivot: "tenancy", search: nil)
                        } else {
                            tenanciesList = try await fetchDataList(modelType: Tenancy.self, pivot: "tenancy", search: username)
                        }
                        if let tenanciesList = tenanciesList {
                            for tenancy in tenanciesList {
                                let property = try await fetchData(modelType: Estate.self, url: tenancy.property)
                                let address = property.address
                                let tenancyDetails = (tenancy, address)
                                tenancies.append(tenancyDetails)
                            }
                        }
                        isLoading = false
                    } catch {
                        isLoading = false
                        showAlert = true
                        alertMessage = "Error loading data. \(error)"
                    }
                }
            }
                
        }
        .navigationBarHidden(true) // Hide the navigation bar to show the hamburger menu instead
        .commonNavigation(navigationTitle: "Home", showAlert: $showAlert, alertMessage: alertMessage)
    }
    
}



struct FourCardView: View {
    var heading: String
    var imageName: String
    
    var body: some View {
        
        VStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .padding()
                .foregroundColor(.black)
            Text(heading)
                .font(.headline)
                .padding(.bottom, 10)
                .foregroundColor(.black)
        }
        .frame(width: 170, height: 130)
        .background(Color.white)
        .cornerRadius(25)
    }
}




#Preview {
    HomeView()
}





