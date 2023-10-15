//
//  SourceCVC.swift
//  BankMandiri
//
//  Created by Maitri Vira on 13/10/23.
//

import UIKit

class NewsCVC: UICollectionViewCell {
    static let identifier = "NewsCVC"
    
    var titleData: String? {
        didSet {
            guard let titleData = titleData else { return }
            title.text = titleData
        }
    }
    
    var descData: String? {
        didSet {
            guard let descData = descData else { return }
            desc.text = descData
        }
    }
    
    var isEmpty: Bool? {
        didSet {
            guard let isEmpty = isEmpty else { return }
            empty.isHidden = !isEmpty
            title.isHidden = isEmpty
            desc.isHidden = isEmpty
        }
    }
    
    fileprivate let view: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let title: UILabel = {
        let title = UILabel()
        title.numberOfLines = 2
        title.font = UIFont.boldSystemFont(ofSize: 16.0)
        title.textColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    fileprivate let desc: UILabel = {
        let desc = UILabel()
        desc.textColor = .black
        desc.numberOfLines = 0
        desc.font = UIFont.systemFont(ofSize: 14.0)
        desc.translatesAutoresizingMaskIntoConstraints = false
        return desc
    }()
    
    fileprivate let empty: UILabel = {
        let empty = UILabel()
        empty.text = "Empty Data"
        empty.textColor = .black
        empty.textAlignment = .center
        empty.numberOfLines = 0
        empty.translatesAutoresizingMaskIntoConstraints = false
        return empty
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(view)
        view.addSubview(title)
        view.addSubview(desc)
        view.addSubview(empty)
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
        
        empty.isHidden = true
        empty.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        empty.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        empty.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        empty.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        title.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        title.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        title.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        desc.topAnchor.constraint(equalTo: title.bottomAnchor).isActive = true
        desc.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        desc.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        desc.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}
