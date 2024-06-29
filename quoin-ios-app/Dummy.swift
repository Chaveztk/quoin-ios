import SwiftUI
   
struct SideMenuView: View {
    @Binding var isShowing: Bool
    @State private var selectedOption: SideMenuOption?

    var body: some View {
        ZStack {
            if isShowing {
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                HStack {
                    VStack(alignment: .leading, spacing: 32) {
                        SideMenuHeaderView()
                        VStack {
                            ForEach(SideMenuOption.allOptions.indices, id: \.self) { index in
                                Button(action: {
                                    selectedOption = SideMenuOption.allOptions[index]
                                    isShowing = false
                                }) {
                                    SideMenuRowView(option: SideMenuOption.allOptions[index], selectedOption: $selectedOption)
                                }
                                .buttonStyle(SideMenuButtonStyle())
                            }
                        }
                        Spacer()
                    }
                    .padding()
                    .frame(width: 270, alignment: .leading)
                    .background(Color.white)
                    .animation(.easeInOut, value: isShowing)
                    Spacer()
                }
            }
        }
        .transition(.move(edge: .leading))
    }
    
    struct SideMenuRowView: View {
        let option: SideMenuOption
        @Binding var selectedOption: SideMenuOption?
        
        private var isSelected: Bool {
            return selectedOption == option
        }
        
        var body: some View {
            HStack {
                Image(systemName: option.imageName)
                    .imageScale(.small)
                Text(option.heading)
                    .font(.subheadline)
                Spacer()
            }
            .padding(.leading)
            .foregroundColor(isSelected ? .blue : .primary)
            .frame(width: 216, height: 44)
            .background(isSelected ? Color.blue.opacity(0.15) : Color.clear)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
    
    struct SideMenuHeaderView: View {
        var body: some View {
            HStack {
                Button(action: {
                    // Add action for the hamburger menu
                }) {
                    Image("ProfileImage")
//                    Image("ProfilePhoto")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .padding(.leading, 0)
                }
                .padding(.leading, 0)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(Greetings())                        .font(.headline)
                    Text("James")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.leading, 4)
                }
                .padding(.leading, -3)
            }
            .padding(.top, 60)
        }
    }
    
    struct SideMenuOption: Identifiable, Equatable {
        let id = UUID()
        var heading: String
        var imageName: String
        var destination: AnyView
        
        static let allOptions: [SideMenuOption] = [
            SideMenuOption(heading: "Announcements", imageName: "filemenu.and.cursorarrow", destination: AnyView(Text("Dashboard View"))),
            SideMenuOption(heading: "Property View", imageName: "house", destination: AnyView(Text("Performance View"))),
            SideMenuOption(heading: "Profile", imageName: "person", destination: AnyView(Text("Profile View"))),
            SideMenuOption(heading: "Settings", imageName: "magnifyingglass", destination: AnyView(Text("Search View"))),
            SideMenuOption(heading: "Notifications", imageName: "bell", destination: AnyView(Text("Notifications View"))),
            SideMenuOption(heading: "Log Out", imageName: "rectangle.portrait.and.arrow.right", destination: AnyView(Text("Notifications View")))
        ]
        
        static func == (lhs: SideMenuOption, rhs: SideMenuOption) -> Bool {
            lhs.id == rhs.id
        }
    }
}

struct SideMenuButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(-5)
            .padding(.bottom, 5)
//            .background(Color.white)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .shadow(radius: 5)
    }
}

#if DEBUG
struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(isShowing: .constant(true))
    }
}
#endif






// calendar widget



//
//import SwiftUI
//
//struct CalendarBookingView: View {
//    var body: some View {
//        VStack {
//            WidgetCard()
//                .frame(width: 170, height: 150)
//                .background(Color(UIColor.white))
//                .cornerRadius(25)
//                .shadow(radius: 5)
//        }
//    }
//}
//
//struct WidgetCard: View {
//    @State private var currentDate: Date = Date()
//    @State private var bookings: [Date: [Event]] = [
//        Calendar.current.startOfDay(for: Date()): [
//            Event(title: "Doctor appointment", time: "10:30am - 11:30am", color: .red, date: Calendar.current.startOfDay(for: Date())),
//            Event(title: "Lunch with colleagues", time: "12:00pm - 1:00pm", color: .green, date: Calendar.current.startOfDay(for: Date())),
//            Event(title: "Dinner with friends", time: "7:00pm - 9:00pm", color: .orange, date: Calendar.current.startOfDay(for: Date()))
//        ]
//    ]
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            HStack(alignment: .top) {
//                VStack {
//                    Text(DateFormatter().shortWeekdaySymbols[Calendar.current.component(.weekday, from: currentDate) - 1])
//                        .font(.headline)
//                        .fontWeight(.bold)
//                    Text("\(Calendar.current.component(.day, from: currentDate))")
//                        .font(.body)
//                        .fontWeight(.bold)
//                }
//                Spacer()
//                VStack(alignment: .leading) {
//                    Text("\(bookings[Calendar.current.startOfDay(for: currentDate)]?.count ?? 0)")
//                        .font(.title3)
//                        .fontWeight(.bold)
//                    Text("Today event")
//                        .font(.caption)
//                }
//            }
//            Spacer()
//            if let events = bookings[Calendar.current.startOfDay(for: currentDate)] {
//                CarouselView(events: events)
//            } else {
//                Text("No events")
//                    .font(.caption)
//                    .foregroundColor(.gray)
//            }
//        }
//        .padding()
//    }
//}
//
//struct CarouselView: View {
//    var events: [Event]
//
//    var body: some View {
//        ScrollView(.vertical) {
//            VStack {
//                ForEach(events, id: \.self) { event in
//                    EventRowView(event: event)
//                        .background(Color(hex: "#F5F5F7")) // Background color of the circle
//                        .cornerRadius(5)
//                        .padding(2)
//                }
//            }
//        }
//        .frame(height: 60)
//    }
//}
//
//struct EventRowView: View {
//    let event: Event
//
//    var body: some View {
//        HStack {
//            Rectangle()
//                .fill(event.color)
//                .frame(width: 5)
//            VStack(alignment: .leading) {
//                Text(event.title)
//                    .font(.caption)
//                    .fontWeight(.bold)
//                Text(event.time)
//                    .font(.caption2)
//            }
//            Spacer() // Add a spacer to push content to the left
//        }
//        .padding(5)
//        .frame(maxWidth: .infinity) // Take up the available width
//    }
//}
//
//struct Event: Identifiable, Hashable {
//    let id = UUID()
//    var title: String
//    var time: String
//    var color: Color
//    var date: Date
//}
//
//struct CalendarBookingView_Previews: PreviewProvider {
//    static var previews: some View {
//        CalendarBookingView()
//    }
//}

