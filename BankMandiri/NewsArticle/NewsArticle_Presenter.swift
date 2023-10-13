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
    
    func gotoWebView() {
        router?.gotoWebView()
    }
}
