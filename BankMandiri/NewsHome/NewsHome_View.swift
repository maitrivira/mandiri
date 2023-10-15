//
//  NewsHome_View.swift
//  BankMandiri
//
//  Created by Maitri Vira on 11/10/23.
//

import Foundation
import UIKit

class NewsHomeViewController: UIViewController {
    var presenter: NewsHome_Presenter_Protocol?
    
    private var collectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewCompositionalLayout { sectionIndex, _ in
            return NewsHomeViewController.createSectionLayout(section: sectionIndex)
        }
    )
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.tintColor = .label
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    private var sections = [NewsHomeSectionType]()
    private var sources = [Sources]()
    
    override func viewDidLoad() {
        presenter?.viewDidLoad()
        setupView()
        configureModel()
    }
    
    public func setupView() {
        self.navigationItem.title = "NEWS"
        view.addSubview(spinner)
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.isHidden = true
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "category")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "search")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "sources")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "emptyData")
        collectionView.register(CategoryCVC.self, forCellWithReuseIdentifier: CategoryCVC.identifier)
        collectionView.register(NewsCVC.self, forCellWithReuseIdentifier: NewsCVC.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func configureModel() {
        sections.append(.categoryTitle)
        sections.append(.category)
        sections.append(.search)
        sections.append(.sourcesTitle)
        sections.append(.sources)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    private static func createSectionLayout(section: Int) -> NSCollectionLayoutSection {
        switch section{
        case 0:
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)
                )
            )
            item.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 2, trailing: 16)
            
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(50)
                ),
                subitem: item,
                count: 1
            )
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            return section
        case 1:
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)
                )
            )
            item.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 8, bottom: 0, trailing: 8)
            
            let horizontalGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .absolute(150),
                    heightDimension: .absolute(50)
                ),
                subitem: item,
                count: 1
            )
            
            let section = NSCollectionLayoutSection(group: horizontalGroup)
            section.orthogonalScrollingBehavior = .continuous
            return section
        case 2:
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)
                )
            )
            item.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 2, trailing: 16)
            
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(70)
                ),
                subitem: item,
                count: 1
            )
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            return section
        case 3:
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)
                )
            )
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 16, bottom: 2, trailing: 16)
            
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(50)
                ),
                subitem: item,
                count: 1
            )
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            return section
        case 4:
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
        default:
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)
                )
            )
            item.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 2, trailing: 16)
            
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(360)
                ),
                subitem: item,
                count: 1
            )
            
            let section = NSCollectionLayoutSection(group: group)
            return section
        }
    }
}

extension NewsHomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let type = sections[section]
        switch type {
        case .category:
            return listOfCategory.count
        case .sources:
            return sources.count
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let type = sections[indexPath.section]
        switch type {
        case .categoryTitle:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "category", for: indexPath)
            let title = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.size.width, height: 50))
            title.text = "Category"
            cell.contentView.addSubview(title)
            return cell
        case .category:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCVC.identifier, for: indexPath) as? CategoryCVC else { return UICollectionViewCell() }
            cell.text = listOfCategory[indexPath.row]
            return cell
        case .search:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "search", for: indexPath)
            let search: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: cell.bounds.size.width, height: cell.bounds.size.height))
            search.placeholder = "Search"
            search.borderStyle = UITextField.BorderStyle.line
            cell.contentView.addSubview(search)
            return cell
        case .sourcesTitle:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sources", for: indexPath)
            let title = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.size.width, height: 50))
            title.text = "Sources"
            cell.contentView.addSubview(title)
            return cell
        case .sources:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCVC.identifier, for: indexPath) as? NewsCVC else { return UICollectionViewCell() }
            cell.titleData = sources[indexPath.row].name
            cell.descData = sources[indexPath.row].description
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let type = sections[indexPath.section]
        switch type {
        case .category:
            if indexPath.row == 0 {
                presenter?.getSourceData()
            } else {
                presenter?.getSourceByCategory(category: listOfCategory[indexPath.row])
            }
        case .sources:
            let source = sources[indexPath.row]
            presenter?.gotoArticle(data: source)
        default:
            break
        }
    }
}

extension NewsHomeViewController: NewsHome_View_Protocol {
    func update(sources: [Sources]) {
        DispatchQueue.main.async {
            self.collectionView.isHidden = false
            self.sources = sources
            self.collectionView.reloadData()
        }
    }
}
