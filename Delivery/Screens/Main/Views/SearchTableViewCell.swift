//
//  SearchTableViewCell.swift
//  Delivery
//
//  Created by Øyvind Hauge on 24/01/2021.
//

import UIKit

final class SearchTableViewCell: UITableViewCell {
    
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
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupChildViews() {
        addSubview(searchWrap)
        addSubview(filterView)
        searchWrap.addSubview(searchField)
    }
}
