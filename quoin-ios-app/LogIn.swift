//
//  LogIn.swift
//  quoin-ios-app
//
//  Created by Chavez King on 08/06/2024.
//

import SwiftUI
import Foundation
import WebKit
import LocalAuthentication

struct LogInView: View {
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    @State private var credentialsFound: Bool = false
    @State private var isLoading: Bool = false
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var rememberMe: Bool = false
    @AppStorage("username") private var username: String = ""
    @AppStorage("userId") private var userId: Int = 1
    @AppStorage("isFaceIDEnabled") private var isFaceIDEnabled: Bool = false
    @AppStorage("isAdmin") private var isAdmin: Bool = false
    @AppStorage("isLandlord") private var isLandlord: Bool = false
    @AppStorage("isTenant") private var isTenant: Bool = false
    @AppStorage("isDirector") private var isDirector: Bool = false

    var body: some View {
        NavigationStack {
            VStack {

                    Text("Welcome")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                    Text("Login to your account")
                        .font(.body )
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding()
                
            }
            .padding(.top, 50) // Add padding to move the text down
            .padding(.bottom, 20) // Add padding to create space above the fields
                            
            Spacer() // Push the login fields to the bottom
            
            VStack(spacing: 15) {
                Loading(isLoading: $isLoading, messageLoading: "Logging you in, just a moment...")

                VStack(alignment: .leading, spacing: 5) {
                    Text("Email")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(.horizontal)

                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.gray)
                            .padding(.leading, 10) // Add leading padding to the icon
                        TextField("Email", text: $username)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding(10)
                    }
                    .frame(height: 50) // Increase the height of the text box field
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                }

                VStack(alignment: .leading, spacing: 5) {
                    Text("Password")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(.horizontal)

                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(.gray)
                            .padding(.leading, 10) // Add leading padding to the icon
                        SecureField("Password", text: $password)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .padding(10)
                    }
                    .frame(height: 50) // Increase the height of the text box field
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                }

                HStack {
                    Toggle(isOn: $isFaceIDEnabled) {
                        Text("Enable Face ID?")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .onChange(of: isFaceIDEnabled) { oldValue, newValue in
                                isFaceIDEnabled = newValue
                                Task {
                                    await doLogin()
                                }
                            }
                    }
                    .padding(.horizontal)

                    Spacer()
                }

                Button(
                    action: {
                        Task {
                            await doLogin()
                        }
                    }
                ) {
                    Text("Log In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
//                        .background(
//                            LinearGradient(
//                                gradient: Gradient(colors: [Color(hex: "#000000"), Color(hex: "#000000")]),
//                                startPoint: .leading,
//                                endPoint: .trailing
//                            )
//                        )
                        .cornerRadius(10)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                Button(action: {
                    // action for forgot password
                }) {
                    Text("Forgot Password?")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.horizontal)
                }
                
                
                
                .navigationDestination(isPresented: $isLoggedIn) {
                    Home(
                    )
                }
            }
            .padding(.bottom, 50) // Add padding to create space below the fields
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Not Recognized"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }

            .padding(.bottom, 50) // Add padding to create space below the fields
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Not Recognized"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }

            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Not Recognized"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
        .onAppear {
            Task {
                do {
                    try (credentialsFound, username, password) = searchCredentials()
                    isFaceIDEnabled = isFaceIDAvailable()
                    print(isFaceIDEnabled)
                    if credentialsFound == true && isFaceIDEnabled == true {
                        await doLogin()
                    }
                } catch {
                    self.username = ""
                    self.password = ""
                }
            }
        }
    }
        
    func doLogin() async {
        isLoading = true
        do {
            let response = try await logIn(email: username, password: password)
            self.userId = response.id
            self.isAdmin = response.isAdmin
            self.isDirector = response.isDirector
            self.isLandlord = response.isLandlord
            self.isTenant = response.isTenant
            do {
                try saveCredentials(username: username, password: password)
            } catch {
                return
            }
            if isFaceIDEnabled == true {
                authenticateWithFaceID { isSuccess in
                    if isSuccess {
                        isLoggedIn = true
                        isLoading = false
                    } else {
                        isLoggedIn = false
                        isLoading = false
                        alertMessage = "Face ID authentication failed."
                        showAlert = true
                    }
                }
            } else {
                self.isLoggedIn = true
            }
            self.isLoading = false
        } catch {
            self.isLoading = false
            self.isLoggedIn = false
            self.showAlert = true
            self.alertMessage = "You have given the wrong credential details: wrong username or password."
        }
    }
}

#Preview {
    LogInView()
}
