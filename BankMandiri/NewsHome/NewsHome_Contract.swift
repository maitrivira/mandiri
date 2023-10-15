//
//  NewsHome_Contract.swift
//  BankMandiri
//
//  Created by Maitri Vira on 11/10/23.
//

import Foundation

protocol NewsHome_View_Protocol: AnyObject {
    var presenter: NewsHome_Presenter_Protocol? { get set }
    func update(sources: [Sources])
}

protocol NewsHome_Presenter_Protocol: AnyObject {
    var view: NewsHome_View_Protocol? { get set }
    var interactor: NewsHome_Interactor_Protocol? { get set }
    var router: NewsHome_Router_Protocol? { get set }
    func viewDidLoad()
    func getSourceData()
    func getSourceByCategory(category: String)
    func gotoArticle(data: Sources)
    func successGetSourceData(result: Result<[Sources], Error>)
}

protocol NewsHome_Interactor_Protocol: AnyObject {
    var presenter: NewsHome_Presenter_Protocol? { get set }
    func getSourceData()
    func getSourceByCategory(category: String)
}

protocol NewsHome_Router_Protocol: AnyObject {
    var entity: NewsHomeViewController? { get }
    static func startExecution() -> NewsHome_Router_Protocol
    func gotoArticleView(data: [String: Any]?)
}
