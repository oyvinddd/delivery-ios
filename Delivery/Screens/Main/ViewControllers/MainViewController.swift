//
//  MainViewController.swift
//  Delivery
//
//  Created by Øyvind Hauge on 20/01/2021.
//

import UIKit

final class MainViewController: UIViewController {
    
    private lazy var topBar: TopBar = {
        let topBar = TopBar(account: Account.current)
        return topBar
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        tableView.register(RestaurantTableViewCell.self,
                           forCellReuseIdentifier: RestaurantTableViewCell.identifier)
        return tableView
    }()
    
    var restaurants: [Restaurant] = [
        Restaurant(title: "Cafe Opera", description: "Nice cafe with food", rating: 0.7),
        Restaurant(title: "Naboen Pub", description: "No description", rating: 0.5)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildViews()
        configureUI()
    }
    
    private func setupChildViews() {
        view.addSubview(topBar)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            topBar.leftAnchor.constraint(equalTo: view.leftAnchor),
            topBar.rightAnchor.constraint(equalTo: view.rightAnchor),
            topBar.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: topBar.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureUI() {
    }
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: RestaurantTableViewCell.self, for: indexPath)
        cell.restaurant = restaurants[indexPath.row]
        return cell
    }
}
