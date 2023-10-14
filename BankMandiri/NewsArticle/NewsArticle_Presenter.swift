//
//  NewsArticle_Presenter.swift
//  BankMandiri
//
//  Created by Maitri Vira on 11/10/23.
//

import Foundation

class NewsArticlePresenter: NewsArticle_Presenter_Protocol {
    var view: NewsArticle_View_Protocol?
    var interactor: NewsArticle_Interactor_Protocol?
    var router: NewsArticle_Router_Protocol?
    
    var data: [String: Any]? = [String: Any]()
    
    func viewDidLoad() {
        if let data = data {
            let source = data["sources"] as? Sources
            let id = source?.id
            
            if let id = id {
                interactor?.getArticleData(id: id)
            }
        }
    }
    
    func gotoWebView() {
        router?.gotoWebView()
    }
    
    func successGetArticleData(result: Result<[Articles], Error>) {
        switch result {
        case .success(let articles):
            view?.update(articles: articles)
        case .failure(let error):
            print(error)
        }
    }
}
