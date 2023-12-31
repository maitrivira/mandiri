//
//  NewsArticle_Router.swift
//  BankMandiri
//
//  Created by Maitri Vira on 11/10/23.
//

import Foundation

class NewsArticleRouter: NewsArticle_Router_Protocol {
    var entity: NewsArticleViewController?
    
    static func createArticle(data: [String: Any]?) -> NewsArticle_Router_Protocol {
        let router = NewsArticleRouter()
        let view = NewsArticleViewController()
        let presenter = NewsArticlePresenter()
        let interactor = NewsArticleInteractor()
        
        view.presenter = presenter
        
        presenter.data = data
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.entity = view
        
        return router
    }
    
    func gotoWebView(url: String) {
        let webRouter = NewsWebViewRouter.createWebView(url: url)
        guard let webView = webRouter.entity else { return }
        guard let viewController = self.entity else { return }
        viewController.navigationController?.pushViewController(webView, animated: true)
    }
}
