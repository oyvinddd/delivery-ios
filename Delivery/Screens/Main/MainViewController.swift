//
//  MainViewController.swift
//  Delivery
//
//  Created by Øyvind Hauge on 20/01/2021.
//

import UIKit

final class MainViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.register(RestaurantTableViewCell.self,
                           forCellReuseIdentifier: RestaurantTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildViews()
        configureUI()
    }
    
    private func setupChildViews() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureUI() {
        view.backgroundColor = .gray
    }
}

final class RestaurantTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: RestaurantTableViewCell.self)
    }
    
    private lazy var wrapperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    init() {
        super.init(style: .default, reuseIdentifier: nil)
        setupChildViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupChildViews() {
        addSubview(wrapperView)
        
        NSLayoutConstraint.activate([
            wrapperView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            wrapperView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            wrapperView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            wrapperView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}
