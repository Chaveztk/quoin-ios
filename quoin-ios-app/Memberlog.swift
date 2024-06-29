import SwiftUI

struct DirectorMemberlogView: View {
    @State private var searchText = ""
    @State private var isPlusButtonActive = false // State for plus button
    @State private var isProfileModalVisible = false // State for profile modal
    
    @State private var name = ""
    @State private var surname = ""
    @State private var email = ""
    @State private var phoneNumber = ""
    @State private var address = ""

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
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
                        
//                        VStack {
//                            Text("Logo here")
//                                .font(.headline)
//                                .multilineTextAlignment(.center) // Align text in center
//                                .padding(.horizontal) // Add padding for centering
//                                .foregroundColor(.gray)
//
//
//                        }
//                        .frame(maxWidth: .infinity) // Ensure VStack takes full width

//                        Spacer() // Spacer after the text
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

                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .padding()
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .padding(.horizontal)
                        .padding(.vertical, 5)

                    // Properties section
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Member log")
                            .font(.headline)
                            .padding(.leading, 20)

                        // Search bar
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            TextField("Search Owner/Tenant", text: $searchText)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        .padding(.horizontal, 20)

                        // Property cards
                        VStack {
                            ForEach(0..<3) { index in
                                Button(action: {
                                    // Add action for the button here
                                    print("Button tapped for Canary Block Wharf \(index + 1)")
                                }) {
                                    MemberlogCardView(propertyName: "Canary Block Wharf \(index + 1)",
                                                      MemberName: "Terry Cruiz",
                                                     email: "terry_smithsmtih@gmail.com",
                                                     rent: "",
                                                     term: "Tenanted",
                                                     isProfileModalVisible: $isProfileModalVisible) // Pass isProfileModalVisible
                                        .padding(.horizontal, 15)
                                        .padding(.top, 10)
                                }
                                .buttonStyle(PlainButtonStyle()) // Removes the blue color from the button
                            }
                        }
                        Text("Owner Renting out")
                            .font(.headline)
                            .padding(.leading, 20)
                            .padding(.top, 20)
                        

                        VStack {
                            ForEach(0..<3) { index in
                                Button(action: {
                                    isProfileModalVisible.toggle() // Toggle bell modal visibility
                                    print("Button tapped for Canary Block Wharf \(index + 1)")
                                }) {
                                    TenantMemberlogCardView(propertyAddress: "Canary Block Wharf \(index + 1)",
                                                     tenantName: "tenant name",
                                                     email: "tenant@email.com",
                                                     rent: "",
                                                     term: "",
                                                     isProfileModalVisible: $isProfileModalVisible) // Pass isProfileModalVisible
                                        .padding(.horizontal, 15)
                                        .padding(.top, 10)
                                }
                                .buttonStyle(PlainButtonStyle()) // Removes the blue color from the button
                            }
                        }


                    }
                    
//                    // plus button start
//                    .overlay(
//                        VStack {
//                            Spacer()
//                            HStack {
//                                Spacer()
//                                Button(action: {
//                                    // Add action for plus button
//                                    isPlusButtonActive.toggle()
//                                }) {
//                                    Image(systemName: "plus.circle.fill")
//                                        .resizable()
//                                        .frame(width: 50, height: 50)
//                                        .foregroundColor(.blue)
//                                        .padding()
//                                }
//                            }
//                        }
//                        .padding(.bottom, 40)
//                    )
//                    // plus button end
                    
                }
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
            }
        }
    }
}




struct ProfileModalView: View {
    var body: some View {
        VStack {
            Capsule()
                .frame(width: 40, height: 5)
                .foregroundColor(.gray)
                .padding(.top, 20)
            
            Text("Tenant Details")
                .font(.body)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            Divider()
            
            // Profile Circular Image
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding(.top, 30)
            
            // Profile Information
            VStack {
                Text("John Doe")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("1 Robinscroft Mews")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                
                Text("User type: Tenant")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                Text("Email: larrygardens-smith@gmail.com")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.bottom, 10)
                Text("Owner: Larry Gardens-Smith")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
            }
            .padding(.bottom, 40)
            
            // Profile Form
            VStack(alignment: .leading, spacing: 20) {
                //                Text("Personal Details")
                //                    .font(.headline)
                Spacer()
            }
            .padding(.horizontal) // Add padding to the whole VStack
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .presentationCornerRadius(35)
    }
}


#Preview {
    DirectorMemberlogView()
    
}

