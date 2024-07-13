//
//  Authenticate.swift
//  quoin-ios-app
//
//  Created by Chavez King on 13/07/2024.
//

import SwiftUI
import LocalAuthentication
import Foundation

func saveCredentials(username: String, password: String) throws {
    let passwordData = password.data(using: String.Encoding.utf8)!
    let query: [String: Any] = [
        kSecClass as String: kSecClassInternetPassword,
        kSecAttrServer as String: "quoinmanagement.com",
        kSecAttrAccount as String: username,
        kSecValueData as String: passwordData
    ]
    let status = SecItemAdd(query as CFDictionary, nil)
    guard status == errSecSuccess else { throw KeychainError.unhandledError(status: status) }
}

func searchCredentials() throws -> (Bool, String, String) {
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
    return (true, account, passwordResult)
}

func authenticateWithFaceID(completion: @escaping (Bool) -> Void) {
    let context = LAContext()
    var error: NSError?
    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Login with Face ID") { authSuccess, authError in
            if authSuccess {
                completion(true)
            } else {
                completion(false)
            }
        }
    } else {
        completion(false)
    }
}

func isFaceIDAvailable() -> Bool {
    let context = LAContext()
    var error: NSError?
    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
        if context.biometryType == .faceID {
            return true
        }
    }
    return false
}

func doLoginSimple(username: String, password: String) async -> (Bool, LogInData?) {
    do {
        let response = try await logIn(email: username, password: password)
        do {
            try saveCredentials(username: username, password: password)
        } catch {
            // do nothing
        }
        return (true, response)
    } catch {
        print("\(error)")
        return (false, nil)
    }
}

enum KeychainError: Error {
    case noPassword
    case unexpectedPasswordData
    case unhandledError(status: OSStatus)
}

struct LoginView: View {
    @State private var isLoading: Bool = false
    @AppStorage("isFaceIDEnabled") private var isFaceIDEnabled: Bool = false
    @AppStorage("username") private var username: String = ""
    @AppStorage("isAdmin") private var isAdmin: Bool?
    @AppStorage("isLandlord") private var isLandlord: Bool?
    @AppStorage("isTenant") private var isTenant: Bool?
    @AppStorage("isDirector") private var isDirector: Bool?
    @State private var password: String = ""
    @State private var user: LogInData?
    @State private var isLoggedIn: Bool = false
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var foundCredentials: Bool = false
    
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
                    .padding(.bottom, 100) // Add padding to create space above the fields

            }

            VStack {
                
                Loading(isLoading: $isLoading, messageLoading: "Logging you in...")
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Email")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    HStack(spacing: -10) {
                        Image(systemName: "envelope")
                            .foregroundColor(.gray)
                            .padding(.leading, 10) // Add leading padding to the icon
                        TextField("Email", text: $username)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding()
                    }
                    .frame(height: 50) // Increase the height of the text box field
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                }
                .padding(.bottom, 10)
                
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Password")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    HStack(spacing: -10) {
                        Image(systemName: "lock")
                            .foregroundColor(.gray)
                            .padding(.leading, 10) // Add leading padding to the icon
                        SecureField("Password", text: $password)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding()
                    }
                    .frame(height: 50) // Increase the height of the text box field
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                }
                .padding(.bottom, 10)

                if !isFaceIDEnabled || !isFaceIDAvailable() {
                    Toggle("Enable Face ID", isOn: $isFaceIDEnabled)
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.horizontal)
                        .padding(.bottom, 10)


                    
                }
                
                    
                
                    Button(action: {
                        isLoading = true
                        Task {
                            let result = await doLoginSimple(username: username, password: password)
                            DispatchQueue.main.async {
                                isLoggedIn = result.0
                                user = result.1
                                isLoading = false
                                if let user = user {
                                    isAdmin = user.isAdmin
                                    isLandlord = user.isLandlord
                                    isTenant = user.isTenant
                                    isDirector = user.isDirector
                                } else {
                                    showAlert = true
                                    alertMessage = "Login failed. Please check your credentials."
                                }
                            }
                        }
                    }) {
                        Text("Log In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.black)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                Button(action: {
                    // action for forgot password
                }) {
                    Text("Forgot Password?")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.horizontal)
                }
            }
            
            .padding()
            
            .onAppear {
                Task {
                    do {
                        (foundCredentials, username, password) = try searchCredentials()
                        if foundCredentials {
                            let result = await doLoginSimple(username: username, password: password)
                            let isLoggedInR = result.0
                            user = result.1
                            if isLoggedInR, let user = user {
                                isAdmin = user.isAdmin
                                isLandlord = user.isLandlord
                                isTenant = user.isTenant
                                isDirector = user.isDirector
                                if isFaceIDAvailable() {
                                    authenticateWithFaceID { isSuccess in
                                        DispatchQueue.main.async {
                                            if isSuccess {
                                                isFaceIDEnabled = true
                                                isLoggedIn = true
                                            } else {
                                                isFaceIDEnabled = false
                                                showAlert = true
                                                alertMessage = "Cannot log in with Face ID on this device."
                                            }
                                        }
                                    }
                                }
                            } else {
                                showAlert = true
                                alertMessage = "Face ID not set up on your phone. Please check your phone device settings."
                                isLoggedIn = false
                            }
                        }
                    } catch {
                        isLoggedIn = false
                    }
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            .navigationDestination(isPresented: $isLoggedIn) {
                HomeView()
            }
        }

    }
}

#Preview {
    LoginView()
}
