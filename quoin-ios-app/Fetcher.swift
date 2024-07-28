//
//  Fetcher.swift
//  quoin-ios-app
//
//  Created by Chavez King on 01/06/2024.
//

import SwiftUI
import Foundation

extension URLRequest {
    mutating func setJSONHeaders() {
        setValue("L69tuV61.plbzYknglGe2jWOcKLeKxQuYfqIYla64", forHTTPHeaderField: "X-Api-Key")
        setValue("application/json", forHTTPHeaderField: "Content-Type")
    }
}

func makeSecureConnection(url: URL) -> URL {
    var comps = URLComponents(url: url, resolvingAgainstBaseURL: false)!
    comps.scheme = "http"
    return comps.url!
}

func makeGetRequest(url: URL, method: String) async throws -> (Data, URLResponse) {
    var request = URLRequest(url: url)
    request.httpMethod = method
    request.setJSONHeaders()
    let (data, response) = try await URLSession.shared.data(for: request)
    return (data, response)
}

func makePostRequest<T: Encodable>(url: URL, method: String, jsonData: T) async throws -> (Data, URLResponse) {
    var request = URLRequest(url: url)
    request.httpBody = try JSONEncoder().encode(jsonData)
    request.httpMethod = method
    request.setJSONHeaders()
    let (data, response) = try await URLSession.shared.data(for: request)
    return (data, response)
}

func buildUrl(pivot: String, search: String?) -> URL? {
    let search = search ?? ""
    guard let searchEncoded = search.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return nil }
    return URL(string: "http://me-quoin-management.us-east-1.elasticbeanstalk.com/api/\(pivot)/?search=\(searchEncoded)")
}

func fetchData<T: CodableWithPK>(modelType: T.Type, url: URL) async throws -> T {
    let url = makeSecureConnection(url: url)
    let (data, response) = try await makeGetRequest(url: url, method: "GET")
    guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else { throw NetworkError.invalidResponse }
    return try JSONDecoder().decode(T.self, from: data)
}

func fetchDataList<T: CodableWithPK>(modelType: T.Type, pivot: String, search: String?) async throws -> [T] {
    guard let url = buildUrl(pivot: pivot, search: search) else { throw NetworkError.invalidResponse }
    let (data, response) = try await makeGetRequest(url: url, method: "GET")
    guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else { throw NetworkError.invalidResponse }
    return try JSONDecoder().decode([T].self, from: data)
}

func logIn(email: String, password: String) async throws -> LogInData {
    let loginData = LogInRequest(email: email, password: password)
    let url = URL(string: "http://me-quoin-management.us-east-1.elasticbeanstalk.com/api/authenticate/")!
    let (data, response) = try await makePostRequest(url: url, method: "POST", jsonData: loginData)
    guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else { throw NetworkError.invalidResponse }
    return try JSONDecoder().decode(LogInData.self, from: data)
}

func makePayment(userId: Int, stripeToken: String, paymentDue: String) async throws -> StripeResult {
    let stripeData = StripeRequest(user: userId, payment_due: paymentDue, stripe_token: stripeToken)
    let url = URL(string: "http://me-quoin-management.us-east-1.elasticbeanstalk.com/api/pay/")!
    let (data, response) = try await makePostRequest(url: url, method: "POST", jsonData: stripeData)
    guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else { throw NetworkError.invalidResponse }
    return try JSONDecoder().decode(StripeResult.self, from: data)
}


enum NetworkError: Error {
    case invalidResponse
}
