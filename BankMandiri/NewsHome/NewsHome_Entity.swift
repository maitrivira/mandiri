//
//  NewsHome_Entity.swift
//  BankMandiri
//
//  Created by Maitri Vira on 11/10/23.
//

import Foundation

public let listOfCategory: [String] = ["All", "Business", "Entertaiment", "General", "Health", "Science", "Sports", "Tech"]

enum NewsHomeSectionType {
    case categoryTitle
    case category
    case search
    case sourcesTitle
    case sources
}
