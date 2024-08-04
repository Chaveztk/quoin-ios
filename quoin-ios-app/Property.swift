
import SwiftUI
import Foundation

struct PropertyView: View {
    @State private var selectedSection: String? = nil
    @State private var navigateToHome = false
    @State private var activeSection: String? = "Term"
    @State private var selectedGrade: EPCGrade = .a // Default EPC grade
    var tenancyId: URL
    @State private var tenancy: Tenancy?
    @State private var estate: Estate?
    @State private var mainPicture: Picture?
    @State private var alertMessage: String = ""
    @State private var showAlert: Bool = false
    @State private var isLoading: Bool = true
    @Environment(\.presentationMode) var presentationMode // Environment variable to dismiss the view
    
    var body: some View {
        NavigationStack {
            ZStack {
                Background()
                if isLoading {
                    Loading(isLoading: $isLoading)
                } else {
                    ScrollView(.vertical) {
                        VStack {
                            
                            VStack {
                                //                                HStack {
                                //                                        Image(systemName: "chevron.left")
                                //                                            .font(.title3)
                                //                                            .foregroundColor(.black)
                                ////                                            .background(
                                ////                                                Rectangle()
                                ////                                                    .fill(Color(.lightGray))
                                ////                                                    .frame(width: 40, height: 40) // Adjust the size as needed
                                ////                                                    .cornerRadius(15)
                                ////                                            )
                                //                                    .padding(.leading, 10)
                                //
                                //                                    Spacer() // Add spacer before the text
                                //
                                //                                    VStack {
                                //                                        Text("1 Canary Wharf")
                                //                                            .font(.headline)
                                //                                        Text("E14 5DR")
                                //                                            .font(.subheadline)
                                //                                    }
                                //
                                //                                    Spacer() // Add spacer after the text
                                //
                                //                                    Button(action: {
                                //                                        // Add action for the plus button
                                //                                    }) {
                                //                                        Image(systemName: "plus")
                                //                                            .font(.title3)
                                //                                            .foregroundColor(.black)
                                ////                                            .background(
                                ////                                                Rectangle()
                                ////                                                    .fill(Color(.lightGray))
                                ////                                                    .frame(width: 40, height: 40) // Adjust the size as needed
                                ////                                                    .cornerRadius(15)
                                ////                                            )
                                //
                                //
                                //                                    }
                                //                                    .padding(.trailing, 10)
                                //                                }
                                //                                .padding(.top, 20) // Add extra padding to clear the status bar area
                                //                                .padding(.horizontal)
                                
                                Spacer()
                            }
                        }
                        
                        //                            BackgroundImage(imageUrl: "https://www.bankrate.com/2022/08/04093343/Buying-a-house-with-an-LLC.jpg?auto=webp&optimize=high&crop=16:9&width=912")
                        //                                .frame(height: UIScreen.main.bounds.height / 4) // Set the height to half the screen
                        //                                .edgesIgnoringSafeArea(.top) // Ignore safe area to cover the status bar
                        if let image = mainPicture, let dataImage = Data(base64Encoded: image.image, options: .ignoreUnknownCharacters) {
                            let image_ = UIImage(data: dataImage)
                            Image(uiImage: image_ ?? UIImage())
                                .resizable()
                                .ignoresSafeArea()
                                .aspectRatio(contentMode: .fill)
                                .padding(.top, -50)
//                                .padding(.horizontal)
                        }
                        //                        .clipShape(RoundedRectangle(cornerRadius: 10)) // Add border radius
                        //                        .shadow(radius: 5)
                        
                        //                    VStack {
                        //                        AnnouncementCardView(
                        //                            title: "",
                        //                            heading: "",
                        //                            date: "",
                        //                            imageName: "TerracedHouse", // Ensure this image exists in your assets
                        //                            announcement: ""
                        //
                        //                        )
                        //                    }
                        //                    .padding(.bottom, -60)
                        
                        VStack {
                            // Subheading: "1 Canary Wharf"
                            //                        Text("1 Canary Wharf")
                            //                            .font(.headline)
                            //                            .padding(.top, 10)
                            //
                            //                        // Text: "E14 1FE"
                            //                        Text("E14 1FE")
                            //                            .font(.subheadline)
                            //                            .foregroundColor(.gray)
                            //                            .padding(.bottom, 1)
                            
                        }
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        
                        if let tenancy = tenancy, let estate = estate {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(estate.address)
                                        .font(.headline)
                                        .padding(.horizontal)
                                        .fontWeight(.bold)
                                    Spacer()
                                    HStack(spacing: 1) { // Adjust spacing as needed
                                        Text(tenancy.rent_pm_swift)
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .foregroundColor(.black) // Ensure the foreground color is set to black
                                        Text("pcm")
                                            .font(.caption)
                                            .fontWeight(.bold)
                                            .foregroundColor(.gray)
                                    }
                                    .padding(.trailing) // Add padding only to the right side of the inner HStack
                                }
                                .padding(.top, 15)
                                
                                HStack {
                                    
                                    Text(estate.postcode)
                                        .font(.footnote)
                                        .padding(.horizontal)
                                        .fontWeight(.bold)
                                        .foregroundColor(.gray)
                                        .padding(.bottom, 10)
                                    Spacer()
                                    //                                Text("Per Calender Month")
                                    //                                    .font(.footnote)
                                    //                                    .padding(.horizontal)
                                    //                                    .fontWeight(.bold)
                                    //                                    .foregroundColor(.gray)
                                    //                                    .padding(.bottom, 10)
                                }
                            }
                            
                            
                            
                            
                            // Bed, Bath, Washing Machine, Square start
                            
                            
                            // Bed, Bath, Parking, Square Feet Details
                            HStack(spacing: 15) {
                                Spacer() // Add spacer to evenly distribute content
                                
                                PropertyDetails(imageName: "bed.double", text: estate.number_beds_string)
                                
                                PropertyDetails(imageName: "drop", text: estate.number_baths_string)
                                PropertyDetails(imageName: "ruler", text: estate.sq_ft_string)
                                
                                //PropertyDetails(imageName: "checkmark.seal", text: "Parking Space 2")
                                
                                Spacer() // Add spacer to evenly distribute content
                            }
                            //                                                        .padding()
                            
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                            
                            .background(Color.white)
                            .cornerRadius(15)
                            .padding(.horizontal)
                            //                                                        .shadow(radius: 2)
                            .font(.caption2)
                            .padding(.top, 20)
                            
                            
                            
                            
                            
                            
                            
                            
                            // Bed, Bath, Washing Machine, Square end
                            //                            Text("Description")
                            //                                .font(.body)
                            //                                .padding(.horizontal)
                            //                                .padding(.vertical, 5)
                            //                                .fontWeight(.bold)
                            //                                .padding(.top, 0)
                            //
                            //                            Text("This is a description of the property that is currently being rented for cheap. I made it cheap so it is affordable to all and every working class group. So there are no excuses to those who say they can't afford it")
                            //                                .font(.body)
                            //                                .padding(.horizontal)
                            //                                .padding(.vertical, 5)
                            //                                .lineLimit(3)
                            
                            
                            
                            //                        // Bed, Bath, Washing Machine, Square start
                            //                        ScrollView(.horizontal, showsIndicators: false) {
                            //                            HStack(spacing: 20) {
                            ////                                Spacer()
                            //
                            //                                PropertyCardsView(imageName: "bed.double", text: "2")
                            //                                PropertyCardsView(imageName: "drop", text: "2")
                            //                                PropertyCardsView(imageName: "checkmark.seal", text: "2")
                            //                                PropertyCardsView(imageName: "square", text: "100")
                            //
                            //                                Spacer()
                            //                            }
                            //                            .padding(.horizontal)
                            //                            .padding(.vertical, 5)
                            //                        }
                            //                        // Bed, Bath, Washing Machine, Square end
                            
                            
                            
                            // Buttin in a row start
                            
                            // Buttons in a row start
                            //                            VStack {
                            //                                        HStack {
                            ////                                            Spacer()
                            //
                            //                                            Button(action: {
                            //                                                withAnimation {
                            //                                                    selectedSection = selectedSection == "Term" ? nil : "Term"
                            //                                                }
                            //                                            }) {
                            //                                                Text("Term")
                            //                                                    .font(.body)
                            //                                                    .padding(10)
                            //                                                    .background(selectedSection == "Term" ? Color(hex: "#F5F5F") : Color.clear)
                            //                                                    .cornerRadius(15)
                            //                                                    .fontWeight(.bold)
                            //                                                    .foregroundColor(selectedSection == "Term" ? .white : .gray)
                            //                                            }
                            //
                            //                                            Button(action: {
                            //                                                withAnimation {
                            //                                                    selectedSection = selectedSection == "Rent" ? nil : "Rent"
                            //                                                }
                            //                                            }) {
                            //                                                Text("Rent")
                            //                                                    .font(.body)
                            //                                                    .padding(10)
                            //                                                    .background(selectedSection == "Rent" ? Color(hex: "#F5F5F") : Color.clear)
                            //                                                    .cornerRadius(15)
                            //                                                    .fontWeight(.bold)
                            //                                                    .foregroundColor(selectedSection == "Rent" ? .white : .gray)
                            //                                            }
                            //
                            //                                            Button(action: {
                            //                                                withAnimation {
                            //                                                    selectedSection = selectedSection == "Address" ? nil : "Address"
                            //                                                }
                            //                                            }) {
                            //                                                Text("Address")
                            //                                                    .font(.body)
                            //                                                    .padding(10)
                            //                                                    .background(selectedSection == "Address" ? Color(hex: "#F5F5F") : Color.clear)
                            //                                                    .cornerRadius(15)
                            //                                                    .fontWeight(.bold)
                            //                                                    .foregroundColor(selectedSection == "Address" ? .white : .gray)
                            //                                            }
                            //
                            ////                                            Spacer()
                            //                                        }
                            ////                                        .padding()
                            //                                        .padding(.bottom, -20)
                            //
                            //                                        VStack {
                            //                                            if selectedSection == "Term" {
                            //                                                VStack(alignment: .center, spacing: 10) {
                            //                                                    Text("Term")
                            //                                                        .font(.body)
                            //                                                        .fontWeight(.bold)
                            //                                                    Text("May 1, 2024 to April 30, 2025.")
                            //                                                        .font(.body)
                            //                                                        .padding(.top, 5)
                            //                                                }
                            ////                                                .padding()
                            ////                                                .background(Color.gray.opacity(0.1))
                            //                                                .cornerRadius(8)
                            //                                                .transition(.opacity)
                            //                                            }
                            //
                            //                                            if selectedSection == "Rent" {
                            //                                                VStack(alignment: .center, spacing: 10) {
                            //                                                    Text("Rent")
                            //                                                        .font(.body)
                            //                                                        .fontWeight(.bold)
                            //                                                    Text("The monthly rent for this property is £2,500.")
                            //                                                        .font(.body)
                            //                                                        .padding(.top, 5)
                            //                                                }
                            ////                                                .padding()
                            ////                                                .background(Color.gray.opacity(0.1))
                            //                                                .cornerRadius(8)
                            //                                                .transition(.opacity)
                            //                                            }
                            //
                            //                                            if selectedSection == "Address" {
                            //                                                VStack(alignment: .center, spacing: 10) {
                            //                                                    Text("Address")
                            //                                                        .font(.body)
                            //                                                        .fontWeight(.bold)
                            //                                                    Text("Located: 1 Canary Wharf E14 1JJ.")
                            //                                                        .font(.body)
                            //                                                        .padding(.top, 5)
                            //                                                }
                            ////                                                .padding()
                            ////                                                .background(Color.gray.opacity(0.1))
                            //                                                .cornerRadius(8)
                            //                                                .transition(.opacity)
                            //                                            }
                            //                                        }
                            //                                        .frame(maxWidth: .infinity)
                            //
                            //                                        .padding()
                            //                                    }
                            
                            
                            // Buttons in a row end
                            
                            
                            
                            
                            
                            
                            //                                                    // Column 1
                            //                                                    VStack(alignment: .leading, spacing: 10) {
                            //                                                        HStack {
                            //                                                            Text("Deposit")
                            //                                                                .font(.headline)
                            //                                                            Spacer()
                            //                                                            Text("£1,700.0")
                            //                                                                .font(.subheadline)
                            //                                                                .foregroundColor(.gray)
                            //                                                        }
                            //                                                        HStack {
                            //                                                            Text("Term")
                            //                                                                .font(.headline)
                            //                                                            Spacer()
                            //                                                            Text("Mar 23, 2024 - May 20, 2024")
                            //                                                                .font(.subheadline)
                            //                                                                .foregroundColor(.gray)
                            //                                                        }
                            //                                                    }
                            //                                                    .padding(.horizontal, 20)
                            //                                                    .padding(.vertical, 10)
                            //                                                    .background(Color.white)
                            //                                                    .cornerRadius(10)
                            //                                                    .shadow(radius: 5)
                            //
                            //                                                    // Column 2
                            //                                                    VStack(alignment: .leading, spacing: 20) {
                            //                                                        HStack {
                            //                                                            Text("Rent")
                            //                                                                .font(.headline)
                            //                                                            Spacer()
                            //                                                            Text("£1,700.0")
                            //                                                                .font(.subheadline)
                            //                                                                .foregroundColor(.gray)
                            //                                                        }
                            //                                                        HStack {
                            //                                                            Text("Floor")
                            //                                                                .font(.headline)
                            //                                                            Spacer()
                            //                                                            Text("216")
                            //                                                                .font(.subheadline)
                            //                                                                .foregroundColor(.gray)
                            //                                                        }
                            //                                                    }
                            //                                                    .padding(.horizontal, 20)
                            //                                                    .padding(.vertical, 10)
                            //                                                    .background(Color.white)
                            //                                                    .cornerRadius(10)
                            //                                                    .shadow(radius: 5)
                            //                                                    .padding(.bottom, 20)
                            
                            
                            
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
                            // Progress bar end
                            
                            .padding(.bottom, 30)
                            
                            
                        }
                        
                        
                        HStack {
                            EPCRatingView(selectedGrade: $selectedGrade)
                                .padding(.top, 10)
                            
                            VStack(alignment: .leading) {
                                Text("EPC Grade: \(selectedGrade.rawValue.uppercased())")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                //                                                            .padding(.bottom, 5)
                                
                                Text(selectedGrade.numberRange)
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                                    .padding(.bottom, 5)
                                    .fontWeight(.bold)
                                Text(loremIpsum)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 5)
                            }
                            .padding(.horizontal)
                        }
                        .padding(.top, 15)
                        .background(Color.white)
                        .cornerRadius(25)
                        .padding(.bottom, 30)
                        .padding(.horizontal)
                        
                        
                        
                        
                        
                        
                        VStack(alignment: .leading) {
                            HStack(spacing: 10) {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(Circle())
                                    .frame(width: 30, height: 40) // Set the frame size
                                    .padding(.bottom, -2)
                                    .padding(.trailing, 10)
                                
                                VStack(alignment: .leading) {
                                    Text("John Doe") // Replace with a random name
                                        .font(.headline)
                                        .foregroundColor(.black)
                                        .fontWeight(.bold)
                                    Text("Type: Landlord") // Type information
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                
                                Spacer()
                                HStack(spacing: 0) {
                                    
                                    Image(systemName: "message.circle.fill")
                                        .font(.system(size: 30))
                                        .foregroundColor(.blue)
                                        .padding(.trailing, 5)
                                    
                                    Image(systemName: "phone.circle.fill")
                                        .font(.system(size: 30))
                                        .foregroundColor(.green)
                                }
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(25)
                        .padding(.horizontal)
                        //                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .padding(.bottom, 20)
                        // Additional cards
                        VStack(spacing: 20) { // Add spacing between vertical stacks
                            HStack(spacing: 20) {
                                NavigationLink(destination: DocumentView()) {
                                    
                                    FourCardView(
                                        heading: "Documents",
                                        imageName: "doc.on.doc"
                                    )
                                    
                                }
                                NavigationLink(destination: MaintenanceLog()) {
                                    FourCardView(
                                        heading: "Maintenance",
                                        imageName: "wrench.and.screwdriver"
                                    )
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 20)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black) // Customize the color if needed
                                .fontWeight(.bold)
                        }
                    }
                }
                
                
                ToolbarItem(placement: .principal) { // Place the title in the center
                                    VStack {
                                        if let estate = estate {
                                            Text(estate.address)
                                                .foregroundColor(.black)
                                                .fontWeight(.bold)
                                        } else {
                                            if isLoading {
                                                Text("Loading...")
                                                    .foregroundColor(.black)
                                                    .fontWeight(.bold)
                                            } else {
                                                Text("Unknown address")
                                                    .foregroundColor(.black)
                                                    .fontWeight(.bold)
                                            }
                                        }
                                    }
                                }
                            }
                            .onAppear {
                                Task {
                                    do {
                                        tenancy = try await fetchData(modelType: Tenancy.self, url: tenancyId)
                                        if let tenancy = tenancy {
                                            estate = try await fetchData(modelType: Estate.self, url: tenancy.estate)
                                            if let estate = estate, let pictures = estate.pictures, let pictureUrl = pictures.first {
                                                mainPicture = try await fetchData(modelType: Picture.self, url: pictureUrl)
                                            }
                                        }
                                        isLoading = false
                                    } catch {
                                        isLoading = false
                                        showAlert = true
                                        alertMessage = "Cannot retrieve data for this tenancy. \(error)"
                                    }
                                }
                            }
                        }
                    }
                }



//struct CardPropertyView: View {
//    var title: String
//    var detail: String
//    var icon: String?
//
//    var body: some View {
//        VStack {
//            if let iconName = icon {
//                Image(systemName: iconName) // Displaying the icon if available
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 50, height: 50)
//                    .foregroundColor(.black)
//                    .padding(.bottom, 10)
//            }
//
//            Text(title)
//                .font(.headline)
//            Text(detail)
//                .font(.subheadline)
//                .foregroundColor(.gray)
//                .multilineTextAlignment(.center)
//                .padding(.horizontal)
//        }
//        .frame(width: 150, height: 150)
//        .background(Color.white)
//        .cornerRadius(10)
//        .shadow(radius: 5)
//        .padding()
//    }
//}





struct PropertyDetails: View {
    var imageName: String
    var text: String
    
    var body: some View {
        HStack {
            VStack {
                
                
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20) // Size of the images
                Text(text)
                //                .font(caption)
                    .foregroundColor(.gray)

                    .bold()
            }
        }
    }
}




struct EPCRatingView: View {
    @Binding var selectedGrade: EPCGrade
    
    var body: some View {
        VStack {
            //            Text("EPC Rating")
            //                .font(.headline)
            //                .fontWeight(.bold)
            //                .foregroundColor(.black)
            //                .padding(.bottom, 5)
            
            // Calculate EPC Grade based on epcNumber
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.3), lineWidth: 10)
                    .frame(width: 70, height: 70)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(selectedGrade.percentage / 100.0))
                    .stroke(selectedGrade.color, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .rotationEffect(Angle(degrees: -90))
                    .frame(width: 70, height: 70)
                
                Text(selectedGrade.rawValue.uppercased())
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            .padding(.top, 10)
            .padding(.bottom, 20)
        }
        .padding(.leading, 20)
        
    }
}





enum EPCGrade: String, CaseIterable {
    case a = "A", b = "B", c = "C", d = "D", e = "E", f = "F", g = "G"
    
    var color: Color {
        switch self {
        case .a: return Color.green
        case .b: return Color.green.opacity(0.6) // Light green
        case .c: return Color.green.opacity(0.3) // Lighter green
        case .d: return Color.yellow
        case .e: return Color.orange.opacity(0.6) // Light orange
        case .f: return Color.orange
        case .g: return Color.red
        }
    }
    
    var percentage: Double {
        switch self {
        case .a: return 100.0
        case .b: return 91.0
        case .c: return 81.0
        case .d: return 68.0
        case .e: return 54.0
        case .f: return 38.0
        case .g: return 20.0
        }
    }
    
    var numberRange: String {
        switch self {
        case .a: return "92+"
        case .b: return "81-91"
        case .c: return "69-80"
        case .d: return "55-68"
        case .e: return "39-54"
        case .f: return "21-38"
        case .g: return "1-20"
        }
    }
}

let loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod semper augue a consequat."






//struct InfoRow: View {
//    var imageName: String
//    var color: Color
//    var text: String
//
//    var body: some View {
//        HStack {
//            Image(systemName: imageName)
//                .foregroundColor(color)
//            Text(text)
//                .padding(.leading)
//            Spacer()
//        }
//    }
//}


#Preview {
    PropertyView(tenancyId: URL(string:"http://me-quoin-management.us-east-1.elasticbeanstalk.com/api/tenancy/3ced92b4-5cf2-46b3-bc1f-8065a6a72d96")!)
}















