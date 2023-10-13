//
//  NewsHome_Presenter.swift
//  BankMandiri
//
//  Created by Maitri Vira on 11/10/23.
//

import Foundation

class NewsHomePresenter: NewsHome_Presenter_Protocol {
    var view: NewsHome_View_Protocol?
    var interactor: NewsHome_Interactor_Protocol?
    var router: NewsHome_Router_Protocol?
    
    func gotoArticle() {
        router?.gotoArticleView()
    }
}
