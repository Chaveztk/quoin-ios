import SwiftUI

struct CalendarBookingView: View {
   @State private var currentMonth: Date = Date()
   @State private var selectedEvent: Event? = nil
   @State private var selectedDate: Date? = nil
   
   @State private var bookings: [Date: [Event]] = [
       Calendar.current.date(from: DateComponents(year: 2024, month: 6, day: 30))!: [
           Event(title: "Doctor appointment, friends and family", time: "10:30am - 11:30am", color: .red, date: Calendar.current.date(from: DateComponents(year: 2024, month: 6, day: 30))!),
           Event(title: "Doctor appointment, friends and family", time: "12:00pm - 1:00pm", color: .green, date: Calendar.current.date(from: DateComponents(year: 2024, month: 6, day: 30))!),
           Event(title: "Doctor appointment, friends and family", time: "7:00pm - 9:00pm", color: .orange, date: Calendar.current.date(from: DateComponents(year: 2024, month: 6, day: 30))!)
       ]
   ]
   
   private var monthsFormatter: DateFormatter {
       let formatter = DateFormatter()
       formatter.dateFormat = "MMMM yyyy"
       return formatter
   }
   
   var body: some View {
       NavigationView {
           ZStack {
               //                Color(hex: "#F5F5F7")
               //                    .edgesIgnoringSafeArea(.all)
               
               LinearGradient(gradient: Gradient(colors: [Color(hex: "#2C2C2C"), Color(hex: "#1A1A1A")]), startPoint: .leading, endPoint: .bottom) // Shades of gray background
                   .edgesIgnoringSafeArea(.all)
               
//                                LinearGradient(gradient: Gradient(colors: [Color(hex: "#F5F5F7"), Color(hex: "#F5F5F7")]), startPoint: .leading, endPoint: .bottom) // Shades of gray background
//                                    .edgesIgnoringSafeArea(.all)
               VStack {
                   VStack {
                       HStack {
                           Button(action: {
                               // Add action for the back button
                           }) {
                               Image(systemName: "chevron.left")
                                   .font(.title2)
                                   .foregroundColor(.white)
//                                    .foregroundColor(.black)
                           }
                           Spacer() // Spacer before the text
                           
                           VStack {
                               Text("Calendar")
                                   .font(.title3)
                                   .multilineTextAlignment(.center) // Align text in center
                                   .foregroundColor(.white)
//                                    .foregroundColor(.black)
                                   .padding(.horizontal) // Add padding for centering
                                   .fontWeight(.bold)
                               
                               
                           }
                           .frame(maxWidth: .infinity) // Ensure VStack takes full width
                           
                           Spacer() // Spacer after the text
                           Button(action: {
                               // Add action for the plus button
                           }) {
                               Image(systemName: "info.circle")  // Updated to information icon
                                   .font(.title2)
                                   .foregroundColor(.white)
//                                    .foregroundColor(.black)
                           }
                       }
                       .padding(.top, 20)
                       .padding(.bottom, 20)
                       .padding(.horizontal)
                       .frame(maxWidth: .infinity) // Ensure VStack takes full width

//                       WidgetCard(bookings: $bookings)
//                           .frame(width: 170, height: 150)
//                           .background(Color(UIColor.white))
//                           .cornerRadius(25)
//                           .shadow(radius: 5)

                       Card {
                           HStack {
                               // Profile Holder (Circle)
                               Image("TerracedHouse")
                                   .resizable()
                                   .frame(width: 50, height: 50)
                                   .clipShape(Circle()) // Clip the image in a circle shape
                               
                               VStack(alignment: .leading, spacing: 6) {
                                   // Announcement Text
                                   Text("Brixton House")
                                       .font(.headline)
                                       .fontWeight(.bold)
                                       .foregroundColor(.white)
                                       .multilineTextAlignment(.leading)
                                   HStack {
                                       Circle()
                                           .fill(Color.red) // Blue with opacity
                                           .frame(width: 5, height: 5)
                                       // Calendar Booking Text
                                       Text("Maintenance")
                                           .font(.caption2)
                                           .fontWeight(.bold)
                                           .foregroundColor(.white)
                                           .multilineTextAlignment(.leading)
                                       Circle()
                                           .fill(Color.green) // Blue with opacity
                                           .frame(width: 5, height: 5)
                                       // Calendar Booking Text
                                       Text("Contractor")
                                           .font(.caption2)
                                           .fontWeight(.bold)
                                           .foregroundColor(.white)
                                           .multilineTextAlignment(.leading)
                                       Circle()
                                           .fill(Color.orange) // Blue with opacity
                                           .frame(width: 5, height: 5)
                                       // Calendar Booking Text
                                       Text("Inspection")
                                           .font(.caption2)
                                           .fontWeight(.bold)
                                           .foregroundColor(.white)
                                           .multilineTextAlignment(.leading)
                                   }
                               }
                               .frame(maxWidth: .infinity, alignment: .leading) // Ensure text alignment
                           }
                       }
                       .frame(maxWidth: .infinity) // Ensure the card expands to the available width
                       .padding(.bottom, -10) // Add padding around the card
                       .padding(.horizontal) // Add padding for centering
                       
                   }
                   
                   //                    KeyButtons(Button1: "Maintenance", Button2: "Inspections", Button3: "Contractors")
                   
                   // Calendar View
                   CalendarView(currentMonth: $currentMonth, bookings: $bookings, onSelectEvent: { event in
                       self.selectedEvent = event
                   }, onSelectDate: { date in
                       if date == self.selectedDate {
                           self.selectedDate = nil // Deselect if same date tapped again
                       } else {
                           self.selectedDate = date
                       }
                   })
                   .padding(20)
                   
                   // Selected date and event details overlay
                   
                   Rectangle()
                       .foregroundColor(.clear)
                       .cornerRadius(15)
                       .overlay(
                           
                           Group {
                               if let selectedDate = selectedDate {
                                   VStack(alignment: .leading) {
                                       Text(selectedDateFormat(selectedDate))
                                           .font(.headline)
                                           .fontWeight(.bold)
                                           .foregroundColor(.white)
//                                            .foregroundColor(.black)
                                           .frame(maxWidth: .infinity, alignment: .leading)
                                           .padding(.horizontal, 20)
                                           .padding(.bottom, -10)
                                       ScrollView(.vertical, showsIndicators: false) {
                                           
                                           if let events = bookings[selectedDate] {
                                               VStack(alignment: .leading) {
                                                   ForEach(events, id: \.self) { event in
                                                       EventRowView(event: event, showImage: true)
                                                   }
                                               }
                                               .foregroundColor(.white)
                                               .cornerRadius(10)
                                               .padding(10)
                                           }
                                       }
                                       
                                       Spacer()
                                   }
                               } else {
                                   EmptyView()
                               }
                           }
                           
                               .frame(maxWidth: .infinity, alignment: .topLeading)
                       )
                   
                   Spacer()
               }
               //                .navigationBarTitle("Calendar Booking", displayMode: .inline)
               //                .padding(.top, 10)
           }
       }
   }
   
   private let dateFormatter: DateFormatter = {
       let formatter = DateFormatter()
       formatter.dateFormat = "E d MMMM, yyyy"
       return formatter
   }()
   
   private func selectedDateFormat(_ date: Date) -> String {
       return dateFormatter.string(from: date)
   }
}

struct CalendarView: View {
   @Binding var currentMonth: Date
   @Binding var bookings: [Date: [Event]]
   var onSelectEvent: ((Event) -> Void)? = nil
   var onSelectDate: ((Date) -> Void)? = nil
   
   private var monthsFormatter: DateFormatter {
       let formatter = DateFormatter()
       formatter.dateFormat = "MMMM yyyy"
       return formatter
   }
   
   var body: some View {
       VStack {
           // Header with navigation buttons
           HStack {
               Text(monthsFormatter.string(from: currentMonth))
                   .font(.title3)
                   .fontWeight(.bold)
                   .foregroundColor(.white)
//                    .foregroundColor(.black)
                   .padding()
               
               Spacer()
               
               Button(action: {
                   self.currentMonth = Calendar.current.date(byAdding: .month, value: -1, to: self.currentMonth)!
               }) {
                   Image(systemName: "chevron.left")
                       .foregroundColor(.white)
//                        .foregroundColor(.black)
               }
               
               Button(action: {
                   self.currentMonth = Calendar.current.date(byAdding: .month, value: 1, to: self.currentMonth)!
               }) {
                   Image(systemName: "chevron.right")
//                        .foregroundColor(.black)
                       .foregroundColor(.white)
                       .padding()
               }
           }
           .background(
               LinearGradient(
                   gradient: Gradient(colors: [Color(hex: "#3A3A3A"), Color(hex: "#2A2A2A")]),
                   startPoint: .top,
                   endPoint: .bottom
               )
           )
           
//                        .background(
//                            Color(hex: "#D5D5D5")
//                                    )
           
           CalendarGridView(currentMonth: $currentMonth, bookings: $bookings, onSelectEvent: onSelectEvent, onSelectDate: onSelectDate)
               .background(Color(hex: "#3B3B3B"))
//                            .background(Color(hex: "#E5E5E5"))
       }
       .background(Color(hex: "#3B3B3B"))
//                .background(Color(hex: "#E5E5E5"))
       .cornerRadius(25)
   }
}

struct CalendarGridView: View {
   @Binding var currentMonth: Date
   @Binding var bookings: [Date: [Event]]
   @State private var selectedDate: Date? = nil // Track selected date
   
   var onSelectEvent: ((Event) -> Void)?
   var onSelectDate: ((Date) -> Void)?
   
   var body: some View {
       VStack {
           ForEach(0..<numberOfRows(), id: \.self) { row in
               HStack {
                   ForEach(0..<7, id: \.self) { column in
                       let dayIndex = (row * 7) + column
                       CalendarCellView(day: self.day(for: dayIndex), events: self.events(for: dayIndex))
                           .onTapGesture {
                               if let day = self.day(for: dayIndex) {
                                   if let event = self.events(for: dayIndex)?.first {
                                       onSelectEvent?(event)
                                   }
                                   onSelectDate?(day)
                                   self.selectedDate = day // Track selected date
                               }
                           }
                           .background(
                               Circle()
                                   .fill(Color.blue.opacity(0.4)) // Blue with opacity
                                   .frame(width: 30, height: 25)
                                   .opacity(self.isSelectedDate(self.day(for: dayIndex)) ? 1.0 : 0.0) // Show only when selected
                           )
                   }
               }
           }
       }
       .gesture(
           DragGesture()
               .onEnded { value in
                   if value.translation.width < -50 {
                       withAnimation(.easeInOut(duration: 0.2)) {
                           self.currentMonth = Calendar.current.date(byAdding: .month, value: 1, to: self.currentMonth) ?? self.currentMonth
                       }
                   } else if value.translation.width > 50 {
                       withAnimation(.easeInOut(duration: 0.2)) {
                           self.currentMonth = Calendar.current.date(byAdding: .month, value: -1, to: self.currentMonth) ?? self.currentMonth
                       }
                   }
               }
       )
   }
   
   private func isSelectedDate(_ date: Date?) -> Bool {
       return date != nil && Calendar.current.isDate(date!, equalTo: selectedDate ?? Date(), toGranularity: .day)
   }
   
   private func numberOfRows() -> Int {
       let range = Calendar.current.range(of: .day, in: .month, for: currentMonth)!
       let count = range.count
       let firstDayOfMonth = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: currentMonth))!
       let weekday = Calendar.current.component(.weekday, from: firstDayOfMonth)
       let numberOfRows = (count + weekday - 1) / 7
       return numberOfRows
   }
   
   private func day(for index: Int) -> Date? {
       let firstDayOfMonth = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: currentMonth))!
       let offsetComponents = DateComponents(day: index - Calendar.current.component(.weekday, from: firstDayOfMonth) + 1)
       return Calendar.current.date(byAdding: offsetComponents, to: firstDayOfMonth)
   }
   
   private func events(for index: Int) -> [Event]? {
       if let day = day(for: index) {
           return bookings[day]
       }
       return nil
   }
}

struct CalendarCellView: View {
   let day: Date?
   let events: [Event]?
   
   var body: some View {
       VStack {
           // Ensure the date text is centered vertically
           Spacer()
           
           Text(day != nil ? "\(Calendar.current.component(.day, from: day!))" : "")
               .frame(width: 40, height: 30)
               .foregroundColor(day != nil ? .white : .clear)
               .fontWeight(.bold)
               .padding(.vertical, 0)
           
           Spacer()
           
           // Display side-by-side dots for multiple events
           if let events = events {
               HStack(spacing: 5) {
                   ForEach(events.indices, id: \.self) { index in
                       Circle()
                           .fill(events[index].color)
                           .frame(width: 5, height: 5)
                           .padding(.top, -5)
                   }
               }
           }
       }
       .padding(.vertical, 0)
   }
}



struct Event: Identifiable, Hashable {
   let id = UUID()
   var title: String
   var time: String
   var color: Color
   var date: Date // Include date in Event
}

struct Card<Content: View>: View {
   let content: Content
   
   init(@ViewBuilder content: () -> Content) {
       self.content = content()
   }
   
   var body: some View {
       content
           .padding(20)
           .background(
               LinearGradient(
                   gradient: Gradient(colors: [Color(hex: "#444444"), Color(hex: "#333333")]),
//                                        gradient: Gradient(colors: [Color(hex: "#006400"), Color(hex: "#013220")]),
//                                        gradient: Gradient(colors: [Color(hex: "#C77EF4"), Color(hex: "#A632EB")]),
                   
                   startPoint: .leading,
                   endPoint: .trailing
               )
           )
           .cornerRadius(25)
           .shadow(radius: 5)
   }
}



struct CalendarBookingView_Previews: PreviewProvider {
   static var previews: some View {
       CalendarBookingView()
   }
}


//struct KeyButtons: View {
//    let Button1: String
//    let Button2: String
//    let Button3: String
//    //    let Button4: String
//
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing: 10) {
//                //                Rectangle()
//                //                    .fill(event.color)
//                //                    .frame(width: 5, height: 40)
//                Text(Button1)
//                    .font(.headline)
//                    .padding(6)
//                    .frame(maxWidth: .infinity)
//                //                        .background(Color(hex: "#F5F5F")) // Change background color
//                    .background(Color.red) // Change background color
//
//                    .foregroundColor(.white) // Change text color
//                    .cornerRadius(10)
//                    .fixedSize(horizontal: true, vertical: false)
//
//                Text(Button2)
//                    .font(.headline)
//                    .padding(6)
//                    .frame(maxWidth: .infinity)
//                //                        .background(Color(hex: "#F5F5F")) // Change background color
//                    .background(Color.green) // Change background color
//
//                    .foregroundColor(.white) // Change text color
//                    .cornerRadius(10)
//                    .fixedSize(horizontal: true, vertical: false)
//
//                Text(Button3)
//                    .font(.headline)
//                    .padding(6)
//                    .frame(maxWidth: .infinity)
//                //                        .background(Color(hex: "#F5F5F")) // Change background color
//                    .background(Color.orange) // Change background color
//
//                    .foregroundColor(.white) // Change text color
//                    .cornerRadius(10)
//                    .fixedSize(horizontal: true, vertical: false)
//
//                //                    Text(Button4)
//                //                        .font(.headline)
//                //                        .padding(9)
//                //                        .frame(maxWidth: .infinity)
//                //                        .background(Color(hex: "#F5F5F")) // Change background color
//                //                        .foregroundColor(.white) // Change text color
//                //                        .cornerRadius(10)
//                //                        .shadow(radius: 5)
//                //                        .fixedSize(horizontal: true, vertical: false)
//            }
//            .padding(.horizontal, 20)
//            .padding(0)
//        }
//    }
//}


struct EventRowView: View {
   let event: Event
   let showImage: Bool // Control image display
   let textColor: Color // Control text color
   let titleFontSize: Font // Control title font size
   let timeFontSize: Font // Control time font size
   let indicatorShape: IndicatorShape // Control indicator shape
   
   enum IndicatorShape {
       case circle
       case rectangle
   }
   
   init(event: Event, showImage: Bool, textColor: Color = .white, titleFontSize: Font = .subheadline, timeFontSize: Font = .footnote, indicatorShape: IndicatorShape = .circle) {
       self.event = event
       self.showImage = showImage
       self.textColor = textColor
       self.titleFontSize = titleFontSize
       self.timeFontSize = timeFontSize
       self.indicatorShape = indicatorShape
   }
   
   var body: some View {
       VStack(alignment: .leading) {
           HStack {
               if indicatorShape == .circle {
                   Circle()
                       .fill(event.color)
                       .frame(width: 5, height: 40)
               } else {
                   Rectangle()
                       .fill(event.color)
                       .frame(width: 5, height: 40)
               }
               
               if showImage {
                   Image("TerracedHouse")
                       .resizable()
                       .aspectRatio(contentMode: .fill)
                       .frame(width: 90, height: 60)
                       .clipShape(RoundedRectangle(cornerRadius: 10))
                       .padding(.bottom, -2)
                       .padding(.trailing, 10)
               }
               
               VStack(alignment: .leading, spacing: 2) {
                   Text(event.title)
                       .font(titleFontSize) // Use titleFontSize property
                       .foregroundColor(textColor) // Use textColor property
                       .fontWeight(.bold)
                   
                   Text(event.time)
                       .font(timeFontSize) // Use timeFontSize property
                       .foregroundColor(textColor) // Use textColor property
               }
               
               Text("")
                   .font(.subheadline)
                   .foregroundColor(.gray)
           }
           .padding(.bottom, 5)
       }
       .padding(.horizontal, 25)
       .padding(.bottom, 10)
   }
}

struct WidgetCard: View {
   @Binding var bookings: [Date: [Event]]
   
   private var currentDate: Date {
       Date()
   }
   
   var body: some View {
       VStack(alignment: .leading, spacing: 0) { // Adjust spacing as per your layout
           HStack {
               VStack(alignment: .leading, spacing: 4) {
                   Text(DateFormatter().shortWeekdaySymbols[Calendar.current.component(.weekday, from: currentDate) - 1])
                       .font(.headline)
                       .fontWeight(.bold)
                   Text("\(Calendar.current.component(.day, from: currentDate))")
                       .font(.body)
                       .fontWeight(.bold)
               }
               Spacer()
               VStack(alignment: .leading) {
                   Text("\(bookings[Calendar.current.startOfDay(for: currentDate)]?.count ?? 0)")
                       .font(.title3)
                       .fontWeight(.bold)
                   Text("Today event")
                       .font(.caption)
               }

           }
           .padding()
           
           Spacer()
           
           if let events = bookings[Calendar.current.startOfDay(for: currentDate)] {
               ScrollView(.vertical) {
                   VStack(spacing: 8) {
                       ForEach(events.prefix(4), id: \.self) { event in
                           VStack {
                               EventRowView(event: event, showImage: false, textColor: .black, titleFontSize: .caption, timeFontSize: .caption2, indicatorShape: .rectangle) // Set indicator shape to rectangle in WidgetCard
                                   .frame(maxWidth: .infinity) // Ensure the row spans the entire width
                                   .padding(.top, -1)
                                   .padding(.bottom, -10)
                           }
                           .background(Color(hex: "#F5F5F7")) // Background color of the row
                           .padding(.horizontal, -25)
                           .cornerRadius(5)
                           

                       }
                       .padding(.horizontal, 10)
                   }
               }
               .padding(.top, -5)

           } else {
               Text("No events Today")
                   .font(.caption)
                   .foregroundColor(.gray)
                   .padding()
           }
       }
   }
}





