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
    var rent_pm_swift: String { if let rent_pm = rent_pm { return String("£ ") + String(rent_pm)} else {return String("N/A")}}
    let deposit: Float?
    let start_date: String?
    let end_date: String?
    let contract_date: String?
    let fee_landlord_pct_pa: Float?
    let documents: [URL?]
}

struct Estate: CodableWithPK {
    let property_id: URL
    var pk: URL { return property_id }
    let owner: URL?
    let pictures: [URL]?
    let address: String
    let postcode: String
    let sq_ft: Float?
//    var sq_ft_string: String { if let sq_ft = sq_ft {return String(sq_ft) + String("sq ft / ") + String(sq_ft*0.092903) + String()} else {return String("N/A")}}
    var sq_ft_string: String { if let sq_ft = sq_ft {return String(sq_ft) + String(" sqft")} else {return String("N/A")}}
    let description: String?
    let number_beds: Int?
    var number_beds_string: String { if let number_beds = number_beds { if number_beds > 1 {return String(number_beds)+String(" bedrooms")} else {return String("1 bedroom")}} else { return String("N/A")}}
    let number_baths: Int?
    var number_baths_string: String { if let number_baths = number_baths { if number_baths > 1 {return String(number_baths)+String(" bathrooms")} else {return String("1 bathroom")}} else { return String("N/A")}}
}

struct Picture: CodableWithPK {
    let id: URL
    var pk: URL { return id }
    let name: String
    let mime_type: String
    let upload_date: String
    let image: String
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
