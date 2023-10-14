//
//  NewsArticle_Contract.swift
//  BankMandiri
//
//  Created by Maitri Vira on 11/10/23.
//

import Foundation

protocol NewsArticle_View_Protocol: AnyObject {
    var presenter: NewsArticle_Presenter_Protocol? { get set }
}

protocol NewsArticle_Presenter_Protocol: AnyObject {
    var view: NewsArticle_View_Protocol? { get set }
    var interactor: NewsArticle_Interactor_Protocol? { get set }
    var router: NewsArticle_Router_Protocol? { get set }
    func viewDidLoad()
    func gotoWebView()
    func successGetArticleData(result: Result<[Articles], Error>)
}

protocol NewsArticle_Interactor_Protocol: AnyObject {
    var presenter: NewsArticle_Presenter_Protocol? { get set }
    func getArticleData()
}

protocol NewsArticle_Router_Protocol: AnyObject {
    var entity: NewsArticleViewController? { get }
    static func createArticle() -> NewsArticle_Router_Protocol
    func gotoWebView()
}
