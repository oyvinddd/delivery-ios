//
//  MainViewController.swift
//  Delivery
//
//  Created by Øyvind Hauge on 20/01/2021.
//

import UIKit

final class MainViewController: UIViewController {
    
    private lazy var topBar: TopBar = {
        return TopBar(account: Account.current)
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
        tableView.register(SearchTableViewCell.self,
                           forCellReuseIdentifier: SearchTableViewCell.identifier)
        return tableView
    }()
    
    var restaurants: [Restaurant] = [
        Restaurant(name: "Cafe Opera", position: Coordinates(0, 0), menu: [], description: "Nice cafe with food", rating: 0.7),
        Restaurant(name: "Naboen Pub", position: Coordinates(0, 0), menu: [], description: "No description", rating: 0.5),
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.section != 0 else {
            let cell = tableView.dequeueReusableCell(for: SearchTableViewCell.self, for: indexPath)
            return cell
        }
        let cell = tableView.dequeueReusableCell(for: RestaurantTableViewCell.self, for: indexPath)
        cell.restaurant = restaurants[indexPath.row]
        return cell
    }
}
