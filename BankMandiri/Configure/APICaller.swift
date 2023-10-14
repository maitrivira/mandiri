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
        static let apiKey = "9531a305c89d4b4981c20b1a9a2aa182"
        static let apiURL = "https://newsapi.org/v2/top-headlines/"
    }
    
    private init() {}
    
    
}
