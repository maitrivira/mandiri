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
        let urlString = "\(APICaller.Constants.apiURL)?sources=\(id)&apiKey=\(APICaller.Constants.apiKey)"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                self?.presenter?.successGetArticleData(result: .failure(NetworkError.serverError))
                return
            }
            
            do {
                let data = try JSONDecoder().decode(ArticleSources.self, from: data)
                self?.presenter?.successGetArticleData(result: .success(data.articles))
            } catch {
                print("url", url)
                self?.presenter?.successGetArticleData(result: .failure(NetworkError.decodeError))
            }
        }
        
        task.resume()
    }
}
