//
//  SearchTableViewCell.swift
//  Delivery
//
//  Created by Øyvind Hauge on 24/01/2021.
//

import UIKit

final class SearchTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: SearchTableViewCell.self)
    }
    
    private lazy var searchWrap: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.TextField.background
        return view
    }()
    
    private lazy var searchField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .clear
        textField.placeholder = "Search for restaurants"
        return textField
    }()
    
    private lazy var filterView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.TextField.background
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupChildViews()
        //backgroundColor = .clear
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupChildViews() {
        contentView.addSubview(searchWrap)
        contentView.addSubview(filterView)
        searchWrap.addSubview(searchField)
        
        NSLayoutConstraint.activate([
            searchWrap.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            searchWrap.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            searchWrap.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            searchWrap.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16)
        ])
    }
}
