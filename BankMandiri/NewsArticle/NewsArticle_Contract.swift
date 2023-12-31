//
//  NewsArticle_Contract.swift
//  BankMandiri
//
//  Created by Maitri Vira on 11/10/23.
//

import Foundation

protocol NewsArticle_View_Protocol: AnyObject {
    var presenter: NewsArticle_Presenter_Protocol? { get set }
    func update(articles: [Articles])
}

protocol NewsArticle_Presenter_Protocol: AnyObject {
    var view: NewsArticle_View_Protocol? { get set }
    var interactor: NewsArticle_Interactor_Protocol? { get set }
    var router: NewsArticle_Router_Protocol? { get set }
    func viewDidLoad()
    func gotoWebView(url: String)
    func successGetArticleData(result: Result<[Articles], Error>)
}

protocol NewsArticle_Interactor_Protocol: AnyObject {
    var presenter: NewsArticle_Presenter_Protocol? { get set }
    func getArticleData(id: String)
}

protocol NewsArticle_Router_Protocol: AnyObject {
    var entity: NewsArticleViewController? { get }
    static func createArticle(data: [String: Any]?) -> NewsArticle_Router_Protocol
    func gotoWebView(url: String)
}
