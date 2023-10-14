//
//  NewsArticle_Entity.swift
//  BankMandiri
//
//  Created by Maitri Vira on 11/10/23.
//

import Foundation

struct ArticleSources: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Articles]
}

struct Articles: Decodable {
    let source: SourcesArticle
    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
}

struct SourcesArticle: Decodable {
    let id: String
    let name: String
}
