//
//  Components.swift
//  quoin-ios-app
//
//  Created by Chavez King on 08/06/2024.
//

import Foundation
import SwiftUI


extension View {
    func commonNavigation(navigationTitle: String, showAlert: Binding<Bool>, alertMessage: String) -> some View {
        self
            .navigationTitle(navigationTitle)
            .alert(isPresented: showAlert) {
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
    }
}



struct Loading: View {
    
    @Binding var isLoading: Bool
    @State var messageLoading: String?
    
    var body: some View {
        if isLoading {
            if let message = messageLoading {
                ProgressView(message)
                    .padding()
            } else {
                ProgressView("Fetching data...")
                    .padding()
            }
        } else {
            EmptyView()
        }
    }
}


struct BaseView<T: CodableWithPK, Content: View>: View {
    @State var data: T?
    @State var dataId: URL
    @State var navTitle: String = ""
    @State private var isLoading: Bool = true
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    let content: (T) -> Content
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Loading(isLoading: $isLoading, messageLoading: "Getting data, just a moment...")
                if let data = data {
                    content(data)
                }
            }
            .commonNavigation(navigationTitle: navTitle, showAlert: $showAlert, alertMessage: alertMessage)
        }
        .onAppear {
            fetchViewData()
        }
        .padding()
    }
    
    private func fetchViewData() {
        Task {
            do {
                data = try await fetchData(modelType: T.self, url: dataId)
                isLoading = false
            } catch {
                isLoading = false
                alertMessage = "Error fetching data. \(error)"
                showAlert = true
                print("\(error)")
            }
        }
    }
    
}


// Helper extension to use hex color start
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
// Helper extension to use hex color end



// background colour for pages start

struct Background: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color(hex: "#F5F5F7"), Color(hex: "#F5F5F7")]), startPoint: .leading, endPoint: .bottom) // Changed to light gray
            .edgesIgnoringSafeArea(.all)
    }
}

//struct Background: View {
//    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [Color(hex: "#E5F2EB"), Color(hex: "#E5F2EB")]), startPoint: .leading, endPoint: .bottom) // Changed to light gray
//            .edgesIgnoringSafeArea(.all)
//    }
//}

// background colour for pages end






// progress bar orginal start

struct CardView<Content>: View where Content: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 5)
            .padding()
    }
}
//
//
//CardView {
//    VStack(alignment: .leading, spacing: 10) {
//        HStack {
//            Text("Service Charge")
//                .font(.headline)
//                .fontWeight(.bold)
//            Spacer()
//            Text("2024")
//                .font(.footnote)
//                .foregroundColor(.gray)
//                .fontWeight(.bold)
//        }
//        .padding(.bottom, 10)
//        
//        Text("Balance: £1000")
//            .font(.title2) // Increased size of the balance
//            .fontWeight(.bold)
//        
//        ZStack(alignment: .center) {
//            ProgressView(value: 0.5)
//                .progressViewStyle(LinearProgressViewStyle(tint: .blue))
//                .scaleEffect(x: 1, y: 4, anchor: .center)
//            
//            Text("50%")
//                .font(.caption)
//                .foregroundColor(.white)
//                .bold()
//        }
//        
//        HStack {
//            Text("Remaining rent £20,000")
//                .font(.footnote)
//                .foregroundColor(.gray)
//            Spacer()
//            Text("1 of 2")
//                .font(.footnote)
//                .foregroundColor(.gray)
//        }
//        .padding(.bottom, 30)
//        
//        NavigationLink(destination: PaymentView()) {
//            Text("Pay Now")
//                .font(.headline)
//                .foregroundColor(.white)
//                .padding()
//                .frame(maxWidth: .infinity)
//                .background(Color.black)
////                                            .background(
////                                                LinearGradient(
////                                                    gradient: Gradient(colors: [Color(hex: "#000000"), Color(hex: "#F5F5F")]),
////                                                    startPoint: .leading,
////                                                    endPoint: .trailing
////                                                )
////                                            )
//                .cornerRadius(10)
//                .cornerRadius(10)
//        }
//        .padding(.horizontal) // Add horizontal padding here
//    }
//    .padding()
//}
// Progress bar orginal end




// progress bar start component

struct ProgressbarCardView: View {

    var title: String
    var balance: String
    var date: String
    var percentage: String
    var remaining: String
    var paymentNumber: String
    var payNow: String
    
    var body: some View {
        ZStack {
            // Underlayed card
            VStack(alignment: .center, spacing: 10) { // Center content horizontally and vertically
//                HStack {
//                    Image(systemName: "dollarsign.circle.fill")
//                        .foregroundColor(.white)
//                        .font(.system(size: 28))
//                        .padding(.trailing, 10) // Adjust spacing
//                    
//                    Text("Underlayed 1")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding(.trailing, 10) // Adjust spacing
//                    
//                    Spacer()
//                    
//                    Image(systemName: "chevron.right")
//                        .foregroundColor(.white)
//                        .font(.headline)
//                        .padding(.leading, 10) // Adjust spacing
//                }
//                .padding(.horizontal, 20) // Add padding to center content within the VStack
//                .padding(.vertical, 15) // Add padding to center content within the VStack
////                .background(Color.blue)
//                .background(Color(hex:"#00000"))
//                .cornerRadius(20)
//                .shadow(radius: 5)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: 350) // Adjust height as needed
            .padding([.leading, .trailing, .top])
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(title)
                        .font(.headline)
                        .fontWeight(.bold)
                    Spacer()
                    Text(date)
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                }
//                .padding(.bottom, 10)
                
                Text(balance)
                    .font(.title2) // Increased size of the balance
                    .fontWeight(.bold)
                
                ZStack(alignment: .center) {
                    ProgressView(value: 0.5)
                        .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                        .scaleEffect(x: 1, y: 4, anchor: .center)
                    
                    Text(percentage)
                        .font(.caption)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                
                HStack {
                    Text(remaining)
                        .font(.footnote)
                        .foregroundColor(.gray)
                    Spacer()
                    Text(paymentNumber)
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                .padding(.bottom, 0)
                
                NavigationLink(destination: PaymentView()) {
                    HStack {
//                        Image(systemName: "creditcard") // Payment icon
//                            .foregroundColor(.white)
                        Text(payNow)
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                    }
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color(hex: "#000000"), Color(hex: "#000000")]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(10)
                    
                }
                .padding(.horizontal)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
//            .shadow(radius: 5)
            .padding()
//            .padding(.top, 42) // Adjust top padding to show the underlayed card
            .offset(y: 20) // Adjust offset to show more of the underlay card

        }
    }
}



// progress bar end component








// background image start

struct BackgroundImage: View {
    var imageUrl: String

    var body: some View {
        GeometryReader { geometry in
            AsyncImage(url: URL(string: imageUrl)) { image in
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



// background image end




// buttons in a row start


struct ButtonRow: View {
    @Binding var selectedSection: String
    let buttons: [String]
    let colorHex: String

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Spacer()
                
                ForEach(buttons, id: \.self) { buttonTitle in
                    Button(action: {
                        withAnimation {
                            selectedSection = buttonTitle
                        }
                    }) {
                        Text(buttonTitle)
                            .font(.body)
                            .padding(10)
                            .background(selectedSection == buttonTitle ? Color(hex: colorHex) : Color.clear)
                            .cornerRadius(15)
                            .fontWeight(.bold)
                            .foregroundColor(selectedSection == buttonTitle ? .white : .gray)
                    }
                }
                
                Spacer()
            }
        }
        .padding()
    }
}

// buttons in a row end


// cicrcle buttons start
struct CircleButton: View {
    let imageName: String
    let label: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .foregroundColor(.black) // Updated color to black
                .background(Color(hex: "#F5F5F7")) // Background color of the circle
                .clipShape(Circle())
            
            Text(label)
                .font(.caption)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
        }
    }
}

// circle buttons end



// navbar start
struct NavBarButton: View {
    var iconName: String
    var buttonText: String
    
    var body: some View {
        VStack {
            Image(systemName: iconName)
            Text(buttonText)
                .font(.caption)
        }
    }
}

// navbar end




// MemberlogCardview for Landlord (viewing total tenants), Directorship start


struct MemberlogCardView: View {
    var propertyName: String
    var MemberName: String
    var email: String
    var rent: String
    var term: String
    @Binding var isProfileModalVisible: Bool // Binding to isProfileModalVisible

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.2.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(8)
                    .padding(.trailing, 10)

                VStack(alignment: .leading) {
                    Text(propertyName)
                        .font(.headline)
                        .truncationMode(.tail)
                        .lineLimit(1)
                    Text(MemberName)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .truncationMode(.tail)
                        .lineLimit(2)
                    Text(email)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .truncationMode(.tail)
                        .lineLimit(2)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text(rent)
                        .font(.subheadline)
                    Text(term)
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
//                Image(systemName: "chevron.right") // Adding chevron
//                    .font(.body)
//                    .foregroundColor(.black)
            }
           .padding()
            Divider()
        }
        .sheet(isPresented: $isProfileModalVisible) {
            ProfileModalView()
                .presentationDetents([.fraction(0.5)]) // Open modal to half screen
        }
    }

}

// MemberlogCardview for Landlord (viewing total tenants), Directorship end



// TenanntMemberlog for Landlord (viewing total tenants), Directorship start

struct TenantMemberlogCardView: View {
    var propertyAddress: String
    var tenantName: String
    var email: String
    var rent: String
    var term: String
    @Binding var isProfileModalVisible: Bool // Binding to isProfileModalVisible

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.2.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(8)
                    .padding(.trailing, 10)

                VStack(alignment: .leading) {
                    Text(propertyAddress)
                        .font(.headline)
                        .truncationMode(.tail)
                        .lineLimit(1)
                    Text(tenantName)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .truncationMode(.tail)
                        .lineLimit(2)
                    Text(email)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .truncationMode(.tail)
                        .lineLimit(2)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text(rent)
                        .font(.subheadline)
                    Text(term)
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
                Image(systemName: "chevron.right") // Adding chevron
                    .font(.body)
                    .foregroundColor(.black)
            }
           .padding()
            Divider()
        }
        .sheet(isPresented: $isProfileModalVisible) {
            ProfileModalView()
                .presentationDetents([.fraction(0.5)]) // Open modal to half screen
        }
    }

}
// TenanntMemberlog for Landlord (viewing total tenants), Directorship end




// notification bell start

struct BellModalView: View {
    var body: some View {
        VStack {
            Capsule()
                .frame(width: 40, height: 5)
                .foregroundColor(.gray)
                .padding(.top, 10)
                .padding(.horizontal)

            Text("Upcoming")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.bottom, 10) // Adjusted padding

            Divider() // Added Divider here

            // Modal content here
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .presentationCornerRadius(15)
        .padding(.bottom, 15)
        ScrollView(.vertical, showsIndicators: false) {
            VStack {

                // Properties section
                VStack(alignment: .leading, spacing: 5) {

                    // Button in a row cards start
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            Button(action: {
                                // Add action for Rent button
                            }) {
                                Text("Date")
                                    .font(.headline)
                                    .padding(9)
                                    .frame(maxWidth: .infinity)
                                    .background(Color(hex: "#F5F5F")) // Change background color
                                    .foregroundColor(.white) // Change text color
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                    .fixedSize(horizontal: true, vertical: false)
                            }
                            Button(action: {
                                // Add action for Documents button
                            }) {
                                Text("Rent")
                                    .font(.headline)
                                    .padding(9)
                                    .frame(maxWidth: .infinity)
                                    .background(Color(hex: "#F5F5F")) // Change background color
                                    .foregroundColor(.white) // Change text color
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                    .fixedSize(horizontal: true, vertical: false)
                            }
                            Button(action: {
                                // Add action for Date Order button
                            }) {
                                Text("Documents")
                                    .font(.headline)
                                    .padding(9)
                                    .frame(maxWidth: .infinity)
                                    .background(Color(hex: "#F5F5F")) // Change background color
                                    .foregroundColor(.white) // Change text color
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                    .fixedSize(horizontal: true, vertical: false)
                            }
                            Button(action: {
                                // Add action for Date Order button
                            }) {
                                Text("This month")
                                    .font(.headline)
                                    .padding(9)
                                    .frame(maxWidth: .infinity)
                                    .background(Color(hex: "#F5F5F")) // Change background color
                                    .foregroundColor(.white) // Change text color
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                    .fixedSize(horizontal: true, vertical: false)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(0)
                    }
                    
                    // Button in a row cards end


                    // Property cards
                    VStack {
                        ForEach(0..<3) { index in
                            UpcomingCardView(propertyName: "Payment due in 4 days \(index + 1)",
                                             propertyAddress: "1 Canary Wharf",
                                             rent: "£1000.00",
                                             term: "25th March",
                                             month: "APR",
                                             date: "10")
                                .padding(.horizontal, 15)
                                .padding(.top, 10)
                        }
                    }
                    VStack {
                        ForEach(0..<3) { index in
                            UpcomingCardView(propertyName: "Gas check due in 4 days \(index + 1)",
                                             propertyAddress: "1 Canary Wharf",
                                             rent: "",
                                             term: "",
                                             month: "APR",
                                             date: "10")
                                .padding(.horizontal, 15)
                                .padding(.top, 10)
                        }
                    }
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
        
    }
}

// notification bell end




// Announcement view start


struct AnnouncementCardView: View {
    var title: String
    var heading: String
    var date: String
    var imageName: String
    var announcement: String

    var body: some View {
        VStack {  // Wrap everything in a VStack to structure the layout correctly
            ZStack {
                // Background with shadow
//                RoundedRectangle(cornerRadius: 50)
//                    .fill(Color.white)

                // Image with rounded corners
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 10)) // Add border radius
                    .shadow(radius: 10)
            }
            .padding()
            .padding(.top, 10)
            .frame(maxWidth: .infinity)
            .padding(.bottom, -15)

            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.leading)
                        .foregroundColor(.black)
                        .padding(.bottom, 5)
                    Text(heading)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding([.leading, .trailing])
                        .lineLimit(nil) // Allows the heading to span multiple lines
                    Text(date)
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                        .padding(.leading)
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
                HStack(spacing: 4) {
                    Spacer()
                    Image(systemName: "sparkles") // Use a system image or replace with appropriate image name
                        .font(.system(size: 20)) // Increased icon size
                        .padding(.trailing, -4) // Added padding to the right
                    Image(systemName: "sparkles") // Use a system image or replace with appropriate image name
                        .font(.system(size: 20)) // Increased icon size
                        .padding(.trailing, 20) // Added padding to the right
                }
                .padding(.bottom, 20)
            }
            .foregroundColor(.black)
        } // Close the VStack
    }
}



// Announcement view end


// Greeting start

func Greetings() -> String {
    let hour = Calendar.current.component(.hour, from: Date())
    switch hour {
    case 00..<12:
        return "Good Morning"
    case 12..<18:
        return "Good Afternoon"
    case 18..<24:
        return "Good Evening"
    default:
        return "Welcome"
    }
}
// Greeting end
