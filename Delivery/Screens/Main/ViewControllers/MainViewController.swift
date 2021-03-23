//
//  MainViewController.swift
//  Delivery
//
//  Created by Øyvind Hauge on 20/01/2021.
//

import UIKit

final class MainViewController: UIViewController {
    
    private enum TableViewType: Int {
        case search, header1, offer, header2, restaurant
    }
    
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
        tableView.registerCell(RestaurantTableViewCell.self)
        tableView.registerCell(SpecialOfferTableViewCell.self)
        tableView.registerCell(SearchTableViewCell.self)
        tableView.registerCell(HeaderTableViewCell.self)
        return tableView
    }()
    
    var restaurants: [Restaurant] = [
        Restaurant(name: "Cafe Opera", position: Coordinates(0, 0), menu: [], description: "Nice cafe with food", rating: 0.7),
        Restaurant(name: "Naboen Pub", position: Coordinates(0, 0), menu: [], description: "No description", rating: 0.5),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildViews()
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
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableViewType.restaurant.rawValue + restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellFromIndexPath(indexPath)
    }
    
    private func cellFromIndexPath(_ indexPath: IndexPath) -> UITableViewCell {
        // search bar
        if indexPath.row == TableViewType.search.rawValue {
            return tableView.dequeueReusableCell(for: SearchTableViewCell.self, for: indexPath)
        }
        // header 1
        if indexPath.row == TableViewType.header1.rawValue {
            let cell = tableView.dequeueReusableCell(for: HeaderTableViewCell.self, for: indexPath)
            cell.header = "Special Offers"
            return cell
        }
        // special offers
        if indexPath.row == TableViewType.offer.rawValue {
            return tableView.dequeueReusableCell(for: SpecialOfferTableViewCell.self, for: indexPath)
        }
        if indexPath.row == TableViewType.header2.rawValue {
            let cell = tableView.dequeueReusableCell(for: HeaderTableViewCell.self, for: indexPath)
            cell.header = "Nearby Restaurants"
            return cell
        }
        // restaurants
        let cell = tableView.dequeueReusableCell(for: RestaurantTableViewCell.self, for: indexPath)
        cell.restaurant = restaurants[indexPath.row - TableViewType.restaurant.rawValue]
        return cell
    }
}
