//
//  NewsHome_Interactor.swift
//  BankMandiri
//
//  Created by Maitri Vira on 11/10/23.
//

import Foundation

class NewsHomeInteractor: NewsHome_Interactor_Protocol {
    var presenter: NewsHome_Presenter_Protocol?
    
    func getSourceByCategory(category: String) {
        let urlString = "\(APICaller.Constants.apiURL)/sources?category=\(category.lowercased())&apiKey=\(APICaller.Constants.apiKey)"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                self?.presenter?.successGetSourceData(result: .failure(NetworkError.serverError))
                return
            }
            
            do {
                let data = try JSONDecoder().decode(SuccesSources.self, from: data)
                self?.presenter?.successGetSourceData(result: .success(data.sources))
            } catch {
                self?.presenter?.successGetSourceData(result: .failure(NetworkError.decodeError))
            }
        }
        
        task.resume()
    }
    
    func getSourceData() {
        let urlString = "\(APICaller.Constants.apiURL)/sources?apiKey=\(APICaller.Constants.apiKey)"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                self?.presenter?.successGetSourceData(result: .failure(NetworkError.serverError))
                return
            }
            
            do {
                let data = try JSONDecoder().decode(SuccesSources.self, from: data)
                self?.presenter?.successGetSourceData(result: .success(data.sources))
            } catch {
                self?.presenter?.successGetSourceData(result: .failure(NetworkError.decodeError))
            }
        }
        
        task.resume()
    }
}
