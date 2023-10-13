//
//  NewsHome_Contract.swift
//  BankMandiri
//
//  Created by Maitri Vira on 11/10/23.
//

import Foundation

protocol NewsHome_View_Protocol: AnyObject {
    var presenter: NewsHome_Presenter_Protocol? { get set }
}

protocol NewsHome_Presenter_Protocol: AnyObject {
    var view: NewsHome_View_Protocol? { get set }
    var interactor: NewsHome_Interactor_Protocol? { get set }
    var router: NewsHome_Router_Protocol? { get set }
    func gotoArticle()
}

protocol NewsHome_Interactor_Protocol: AnyObject {
    var presenter: NewsHome_Presenter_Protocol? { get set }
}

protocol NewsHome_Router_Protocol: AnyObject {
    var entity: NewsHomeViewController? { get }
    static func startExecution() -> NewsHome_Router_Protocol
    func gotoArticleView()
}
