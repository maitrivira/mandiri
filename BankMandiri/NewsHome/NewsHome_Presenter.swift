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
    
    func viewDidLoad() {
        interactor?.getSourceData()
    }
    
    func gotoArticle(data: Sources) {
        let param = ["sources": data]
        router?.gotoArticleView(data: param)
    }
    
    func successGetSourceData(result: Result<[Sources], Error>) {
        switch result {
        case .success(let sources):
            view?.update(sources: sources)
        case .failure(let error):
            print(error)
        }
    }
}
