//
//  CategoryCVC.swift
//  BankMandiri
//
//  Created by Maitri Vira on 11/10/23.
//

import UIKit

class CategoryCVC: UICollectionViewCell {
    static let identifier = "CategoryCVC"
    
    var text: String? {
        didSet {
            guard let text = text else { return }
            categoryTitle.text = text
        }
    }
    
    fileprivate let view: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let categoryTitle: UILabel = {
        let title = UILabel()
        title.textAlignment = .center
        title.textColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(view)
        view.addSubview(categoryTitle)
        cellConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellConstraint() {
        view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        categoryTitle.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        categoryTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        categoryTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        categoryTitle.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
