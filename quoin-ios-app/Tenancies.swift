//
//  HomeView.swift
//  quoin-ios-app
//
//  Created by Chavez King on 04/08/2024.
//

import Foundation

import SwiftUI

struct Tenancies: View {
    @AppStorage("username") private var username: String = ""
    @AppStorage("isAdmin") private var isAdmin: Bool = false
    @AppStorage("isLandlord") private var isLandlord: Bool = false
    @AppStorage("isTenant") private var isTenant: Bool = false
    @AppStorage("isDirector") private var isDirector: Bool = false
    @State private var tenancies: [Tenancy] = []
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var isLoading: Bool = true
    @State private var searchText = ""
 
    var body: some View {
        
        NavigationStack {
            Loading(isLoading: $isLoading, messageLoading: "Gathering data. Just a sec...")
            ZStack(alignment:.leading) {
                Background()
                if isLoading == false {
                    ScrollView(.vertical) {
                        VStack(alignment:.leading) {
                            ForEach(tenancies, id: \.pk) { tenancy in
                                NavigationLink(destination: PropertyView(tenancyId: tenancy.pk)
                                ) {
                                    PropertyCard(tenancy: tenancy)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .commonNavigation(navigationTitle: "My Tenancies", showAlert: $showAlert, alertMessage: alertMessage)
            .onAppear {
                Task {
                    do {
                        if isAdmin {
                            tenancies = try await fetchDataList(modelType: Tenancy.self, pivot: "tenancy", search: nil, filter: "-end_date")
                        } else {
                            tenancies = try await fetchDataList(modelType: Tenancy.self, pivot: "tenancy", search: username, filter: "-end_date")
                        }
                        isLoading = false
                    } catch {
                        isLoading = false
                        showAlert = true
                        alertMessage = "Error loading data. \(error)"
                    }
                }
            }
        }
    }
}


struct PropertyCard: View {
    @State var tenancy: Tenancy?
    
    var body: some View {
        if let tenancy = tenancy {
            ZStack {
                BackgroundTwo()
                VStack {
                    HStack {
                        Text(tenancy.address)
                            .font(.title2)
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                        Spacer()
                        Text("\(tenancy.rent_pm_swift) pcm")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(.white)
                    }
                    Spacer()
                    HStack {
                        Text(tenancy.start_date ?? "No Start Date")
                            .foregroundStyle(.white)
                        Spacer()
                        Text(tenancy.end_date ?? "No End Date")
                            .foregroundStyle(.white)
                    }
                }
                .padding()
            }
        }
    }
}


#Preview {
    Tenancies()
}
