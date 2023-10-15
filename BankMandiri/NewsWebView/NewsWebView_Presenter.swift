//
//  NewsWebView_Presenter.swift
//  BankMandiri
//
//  Created by Maitri Vira on 13/10/23.
//

import Foundation

class NewsWebViewPresenter: NewsWebView_Presenter_Protocol {
    var view: NewsWebView_View_Protocol?
    var interactor: NewsWebView_Interactor_Protocol?
    var router: NewsWebView_Router_Protocol?
    
    func setupWebView(data: [String: Any]?) {
        if let data = data {
            let link = data["link"] as? String
            if let link = link {
                view?.reloadWeb(link: link)
            }
        }
    }
}
