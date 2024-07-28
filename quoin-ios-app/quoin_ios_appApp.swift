//
//  quoin_ios_appApp.swift
//  quoin-ios-app
//
//  Created by Chavez King on 01/06/2024.
//

import SwiftUI
import Stripe

@main
struct quoin_ios_appApp: App {
    
    init() {
        StripeAPI.defaultPublishableKey = "pk_test_51NbhGlFu0sobMpdO7RG8As0I0lhjA2URdCImpy3PM4DcOJqcki4l1JrZdZyKlxKp2xxaNLI5l6qbGZYRVC1BvQfA009eiUSRu8"
    }
    
    
    var body: some Scene {
        WindowGroup {
            LoginView()
            //LoginView()
//            HomeView()
        }
    }
}
