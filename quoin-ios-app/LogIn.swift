//
//  LogIn.swift
//  quoin-ios-app
//
//  Created by Chavez King on 08/06/2024.
//

import SwiftUI
import Foundation
import WebKit

struct LogInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    @State private var isLoading: Bool = false
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var isAdmin: Bool = false
    @State private var isLandlord: Bool = false
    @State private var isTenant: Bool = false
    @State private var isDirector: Bool = false
    @State private var username: String = ""
    @State private var rememberMe: Bool = false

    
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
                        TextField("Email", text: $email)
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
                    Toggle(isOn: $rememberMe) {
                        Text("Remember me?")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal)

                    Spacer()
                }

                Button(
                    action: {
                        Task.init(operation: { await doLogin() })
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
                    HomeView(
                        isAdmin: isAdmin,
                        isTenant: isTenant,
                        isLandlord: isLandlord,
                        isDirector: isDirector,
                        username: username
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
            do {
                try searchCredentials()
            } catch {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    func doLogin() async {
        isLoading = true
        do {
            let response = try await logIn(email: email, password: password)
            self.isAdmin = response.isAdmin
            self.isDirector = response.isDirector
            self.isLandlord = response.isLandlord
            self.isTenant = response.isTenant
            self.username = response.username
            self.isLoggedIn = true
            do {
                try saveCredentials(email: email, password: password)
            } catch {
                return
            }
            self.isLoading = false
        } catch {
            self.isLoading = false
            self.isLoggedIn = false
            self.showAlert = true
            self.alertMessage = "You have given the wrong credential details: wrong username or password."
        }
    }
    
    func saveCredentials(email: String, password: String) throws {
        if self.rememberMe == true {
            let passwordData = password.data(using: String.Encoding.utf8)!
            let query: [String: Any] = [
                kSecClass as String: kSecClassInternetPassword,
                kSecAttrServer as String: "quoinmanagement.com",
                kSecAttrAccount as String: email,
                kSecValueData as String: passwordData
            ]
            let status = SecItemAdd(query as CFDictionary, nil)
            guard status == errSecSuccess else { throw KeychainError.unhandledError(status: status)}
        }
    }
    
    func searchCredentials() throws {
        let query: [String: Any] = [
            kSecClass as String: kSecClassInternetPassword,
            kSecAttrServer as String: "quoinmanagement.com",
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnAttributes as String: true,
            kSecReturnData as String: true
        ]
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        guard status != errSecItemNotFound else { throw KeychainError.noPassword }
        guard status == errSecSuccess else { throw KeychainError.unhandledError(status: status) }
        guard let existingItem = item as? [String: Any],
              let passwordData = existingItem[kSecValueData as String] as? Data,
              let passwordResult = String(data: passwordData, encoding: String.Encoding.utf8),
              let account = existingItem[kSecAttrAccount as String] as? String
        else {
            throw KeychainError.unexpectedPasswordData
        }
        self.email = account
        self.password = passwordResult
        self.rememberMe = true
    }
    
}

enum KeychainError: Error {
    case noPassword
    case unexpectedPasswordData
    case unhandledError(status: OSStatus)
}

#Preview {
    LogInView()
}
