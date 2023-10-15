//
//  NewsHome_Entity.swift
//  BankMandiri
//
//  Created by Maitri Vira on 11/10/23.
//

import Foundation

public let listOfCategory: [String] = ["All", "Business", "Entertaiment", "General", "Health", "Science", "Sports", "Technology"]

enum NewsHomeSectionType {
    case categoryTitle
    case category
    case search
    case sourcesTitle
    case sources
}

struct SuccesSources: Decodable {
    let status: String
    let sources: [Sources]
}

struct Sources: Decodable {
    let id: String
    let name: String
    let description: String
    let url: String
    let category: String
    let language: String
    let country: String
}
