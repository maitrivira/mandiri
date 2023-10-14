//
//  NewsWebView_Router.swift
//  BankMandiri
//
//  Created by Maitri Vira on 13/10/23.
//

import Foundation

class NewsWebViewRouter: NewsWebView_Router_Protocol {
    var entity: NewsWebViewViewController?
    
    static func createWebView(data: [String: Any]?) -> NewsWebView_Router_Protocol {
        let router = NewsWebViewRouter()
        let view = NewsWebViewViewController()
        let presenter = NewsWebViewPresenter()
        let interactor = NewsWebViewInteractor()
        
        view.presenter = presenter
        
        presenter.setupWebView(data: data)
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.entity = view
        
        return router
    }
}
