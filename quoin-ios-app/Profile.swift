import SwiftUI
import Foundation

struct ProfileView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    @State private var searchText = ""
    @State private var name = "James"
    @State private var surname = "Thompson"
    @State private var address = "17 Brickhall Lane"
    @State private var email = "James.thompson@example.com"
    @State private var phoneNumber = "07323 432 232"
    @State private var currentPassword = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    @State private var announcements = false
    @State private var rentReceived = false
    @State private var news = false
    @State private var notifications = false
    @State private var calendar = false

    var body: some View {
        NavigationView {
            ZStack {
                Background()
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack {
                        HStack {
                            // Back button and plus button if needed
                            // Uncomment and add actions if required
                            // Button(action: {
                            //     // Add action for the back button
                            // }) {
                            //     Image(systemName: "chevron.left")
                            //         .font(.title)
                            //         .foregroundColor(.black)
                            // }
                            // .padding(.leading, 20)
                            // Spacer()
                            // Button(action: {
                            //     // Add action for the plus button
                            // }) {
                            //     Image(systemName: "plus")
                            //         .font(.title)
                            //         .foregroundColor(.black)
                            // }
                            // .padding(.trailing, 20)
                        }
                        .padding(.top, 20)
                        .padding(.horizontal)

                        // Profile Circular
                        Image("ProfileImage")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .padding(.top, 30)

                        // Profile Information
                        VStack {
                            Text("James Thompson")
                                .font(.title3)
                                .fontWeight(.bold)

                            Text(address)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .fontWeight(.bold)

                            Text("User type: Landlord")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .fontWeight(.bold)
                        }
                        .padding(.bottom, 40)

                        // Personal Details Section
                        Text("Personal Details")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.leading)
                            .padding(.bottom, 10)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        VStack(alignment: .leading, spacing: 0) {
                            TextField("Name", text: $name)
                                .padding(12)
                            Divider()
                            TextField("Surname", text: $surname)
                                .padding(12)
                            Divider()
                            TextField("Email", text: $email)
                                .padding(12)
                            Divider()
                            TextField("Phone Number", text: $phoneNumber)
                                .padding(12)
                            Divider()
                            TextField("Address", text: $address)
                                .padding(12)
                        }
                        .background(Color.white)
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .padding(.bottom, 15) // Slightly reduce the padding between cards

                        // Account Section
                        Text("Account")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.leading)
                            .padding(.bottom, 10)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                NavigationLink(destination: PaymentMethodView()) {
                                    HStack(spacing: 5) {
                                        Text("Payment Methods")
                                    }
                                    .foregroundColor(.gray)
                                    Spacer()
                                    Image("VisaIcon")
                                        .resizable()
                                        .frame(width: 40, height: 15)
                                        .background(Color.white)
                                        .cornerRadius(10)
                                    Text("•••• 4921")
                                        .foregroundColor(.gray)
                                }
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                        }
                        .background(Color.white)
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .padding(.bottom, 15) // Slightly reduce the padding between cards

                        // Password Section
                        Text("Password")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.leading)
                            .padding(.bottom, 10)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        VStack(alignment: .leading, spacing: 0) {
                            SecureField("Current Password", text: $currentPassword)
                                .padding(12)
                            Divider()
                            SecureField("New Password", text: $newPassword)
                                .padding(12)
                            Divider()
                            SecureField("Confirm Password", text: $confirmPassword)
                                .padding(12)
                        }
                        .background(Color.white)
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .padding(.bottom, 15) // Slightly reduce the padding between cards

                        // Notifications Section
                        Text("Notifications")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.leading)
                            .padding(.bottom, 10)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        VStack(alignment: .leading, spacing: 0) {
                            Toggle("Announcements", isOn: $announcements)
                                .padding(12)
                            Divider()
                            Toggle("Rent Received", isOn: $rentReceived)
                                .padding(12)
                            Divider()
                            Toggle("Payment Reminders", isOn: $rentReceived)
                                .padding(12)
                            Divider()
                            Toggle("News", isOn: $news)
                                .padding(12)
                            Divider()
                            Toggle("Notifications", isOn: $notifications)
                                .padding(12)
                            Divider()
                            Toggle("Calendar", isOn: $calendar)
                                .padding(12)
                        }
                        .background(Color.white)
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .padding(.bottom, 15) // Slightly reduce the padding between cards
                    }
                    .navigationBarTitle("", displayMode: .inline)
                    .navigationBarHidden(true)
                }
            }
        }
    }
}


#Preview {
    ProfileView()
}
