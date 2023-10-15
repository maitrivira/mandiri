//
//  NewsArticle_View.swift
//  BankMandiri
//
//  Created by Maitri Vira on 11/10/23.
//

import Foundation
import UIKit

class NewsArticleViewController: UIViewController {
    var presenter: NewsArticle_Presenter_Protocol?
    
    private var articles = [Articles]()
    
    private var collectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewCompositionalLayout { sectionIndex, _ in
            return NewsArticleViewController.createSectionLayout(section: sectionIndex)
        }
    )
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.tintColor = .label
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    override func viewDidLoad() {
        presenter?.viewDidLoad()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    public func setupView() {
        self.navigationItem.title = "ARTICLE"
        view.addSubview(spinner)
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.isHidden = true
        collectionView.register(NewsCVC.self, forCellWithReuseIdentifier: NewsCVC.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private static func createSectionLayout(section: Int) -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            )
        )
        item.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        
        let verticalGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(500)
            ),
            subitem: item,
            count: 3
        )
        
        let section = NSCollectionLayoutSection(group: verticalGroup)
        return section
    }
}

extension NewsArticleViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCVC.identifier, for: indexPath) as? NewsCVC else { return UICollectionViewCell() }
        cell.titleData = articles[indexPath.row].title
        cell.descData = articles[indexPath.row].description
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let link = articles[indexPath.row].url ?? ""
        presenter?.gotoWebView(link: link)
    }
}

extension NewsArticleViewController: NewsArticle_View_Protocol {
    func update(articles: [Articles]) {
        DispatchQueue.main.async {
            self.collectionView.isHidden = false
            self.articles = articles
            self.collectionView.reloadData()
        }
    }
}
