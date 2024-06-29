//
//  Models.swift
//  quoin-ios-app
//
//  Created by Chavez King on 01/06/2024.
//

import SwiftUI
import Foundation

protocol CodableWithPK: Codable {
    var pk: URL { get }
}

struct Tenant: CodableWithPK {
    let id: URL
    var pk: URL { return id }
    let job_name: String
    let employer: String
    let salary: Float
    let current_address: String
    let phone: String
}

struct Tenancy: CodableWithPK {
    let rental_id: URL
    var pk: URL { return rental_id }
    let property: URL
    let tenant: [URL]
    let rent_pm: Float?
    let deposit: Float?
    let start_date: String?
    let end_date: String?
    let contract_date: String?
    let fee_landlord_pct_pa: Float?
    let documents: [URL?]
}

protocol PostData: Encodable {}

struct LogInRequest: PostData {
    let email: String
    let password: String
}

struct LogInData: CodableWithPK {
    var pk: URL { return URL(string:"")! }
    let isAdmin: Bool
    let isDirector: Bool
    let isTenant: Bool
    let isLandlord: Bool
    let username: String
}
