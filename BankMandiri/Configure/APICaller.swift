//
//  API.swift
//  BankMandiri
//
//  Created by Maitri Vira on 13/10/23.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
}

enum NetworkError: Error {
    case serverError
    case decodeError
}

final class APICaller {
    static let shared = APICaller()
    
    struct Constants {
        static let apiKey = "19265ec268d14e0c8a3c13d0b58d2eac"
        static let apiURL = "https://newsapi.org/v2/top-headlines"
    }
    
    private init() {}
    
    
}
