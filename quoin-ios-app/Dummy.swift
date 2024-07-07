   




import SwiftUI

struct Dummy: View {
    var body: some View {
        VStack {
            
        }
    }
}









#Preview {
    Dummy()
}














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


