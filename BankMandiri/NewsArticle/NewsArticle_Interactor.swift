//
//  NewsArticle_Interactor.swift
//  BankMandiri
//
//  Created by Maitri Vira on 11/10/23.
//

import Foundation

class NewsArticleInteractor: NewsArticle_Interactor_Protocol {
    var presenter: NewsArticle_Presenter_Protocol?
    
    func getArticleData(id: String) {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=\(id)&apiKey=9531a305c89d4b4981c20b1a9a2aa182") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                self?.presenter?.successGetArticleData(result: .failure(NetworkError.serverError))
                return
            }
            
            do {
                let data = try JSONDecoder().decode(ArticleSources.self, from: data)
                self?.presenter?.successGetArticleData(result: .success(data.articles))
            } catch {
                self?.presenter?.successGetArticleData(result: .failure(NetworkError.decodeError))
            }
        }
        
        task.resume()
    }
}
