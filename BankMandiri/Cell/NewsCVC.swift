//
//  SourceCVC.swift
//  BankMandiri
//
//  Created by Maitri Vira on 13/10/23.
//

import UIKit

class NewsCVC: UICollectionViewCell {
    static let identifier = "NewsCVC"
    
    fileprivate let view: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let title: UILabel = {
        let title = UILabel()
        title.text = "title"
        title.textColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    fileprivate let desc: UILabel = {
        let desc = UILabel()
        desc.text = "desc"
        desc.textColor = .black
        desc.numberOfLines = 0
        desc.translatesAutoresizingMaskIntoConstraints = false
        return desc
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(view)
        view.addSubview(title)
        view.addSubview(desc)
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
        
        title.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        title.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        title.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        desc.topAnchor.constraint(equalTo: title.bottomAnchor).isActive = true
        desc.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        desc.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        desc.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}
