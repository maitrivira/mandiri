//
//  NewsWebView_Contract.swift
//  BankMandiri
//
//  Created by Maitri Vira on 13/10/23.
//

import Foundation

protocol NewsWebView_View_Protocol: AnyObject {
    var presenter: NewsWebView_Presenter_Protocol? { get set }
}

protocol NewsWebView_Presenter_Protocol: AnyObject {
    var view: NewsWebView_View_Protocol? { get set }
    var interactor: NewsWebView_Interactor_Protocol? { get set }
    var router: NewsWebView_Router_Protocol? { get set }
}

protocol NewsWebView_Interactor_Protocol: AnyObject {
    var presenter: NewsWebView_Presenter_Protocol? { get set }
}

protocol NewsWebView_Router_Protocol: AnyObject {
    var entity: NewsWebViewViewController? { get }
    static func createWebView() -> NewsWebView_Router_Protocol
}
