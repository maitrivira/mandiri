//
//  NewsHome_Router.swift
//  BankMandiri
//
//  Created by Maitri Vira on 11/10/23.
//

import Foundation

class NewsHomeRouter: NewsHome_Router_Protocol {
    var entity: NewsHomeViewController?
    
    static func startExecution() -> NewsHome_Router_Protocol {
        let router = NewsHomeRouter()
        let view = NewsHomeViewController()
        let presenter = NewsHomePresenter()
        let interactor = NewsHomeInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.entity = view
        
        return router
    }
    
    func gotoArticleView() {
        let articleRouter = NewsArticleRouter.createArticle()
        guard let articleView = articleRouter.entity else { return }
        guard let viewController = self.entity else { return }
        viewController.navigationController?.pushViewController(articleView, animated: true)
    }
}
