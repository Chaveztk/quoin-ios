//
//  HomeView.swift
//  quoin-ios-app
//
//  Created by Chavez King on 04/08/2024.
//

import Foundation

import SwiftUI

struct Home: View {
    @AppStorage("username") private var username: String = ""
    @AppStorage("isAdmin") private var isAdmin: Bool = false
    @AppStorage("isLandlord") private var isLandlord: Bool = false
    @AppStorage("isTenant") private var isTenant: Bool = false
    @AppStorage("isDirector") private var isDirector: Bool = false
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var searchText = ""
 
    var body: some View {
        NavigationStack {
            ZStack(alignment: .leading) {
                Background()
                ScrollView(.vertical) {
                    Spacer()
                    Text("Welcome to the Quoin Management app, \(username).")
                    Spacer()
                    Text("Annoucements")
                        .fontDesign(.rounded)
                        .font(.title)
                    Spacer()
                    NavigationLink(destination: Tenancies()) {
                        HomeCard(title: "My Tenancies")
                        // .padding()
                    }
                    Spacer()
                }
            }
            .commonNavigation(navigationTitle: "Welcome", showAlert: $showAlert, alertMessage: alertMessage)
        }
    }
}

struct HomeCard: View {
    @State var title: String
    
    var body: some View {
            ZStack {
                BackgroundTwo()
                HStack {
                    HStack {
                        Text(title)
                            .font(.title2)
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                    }
                    Spacer()
                    Image(systemName: "chevron.compact.forward")
                        .foregroundColor(.white)
                }
                .padding()
            }
    }
}


#Preview {
    Home()
}
