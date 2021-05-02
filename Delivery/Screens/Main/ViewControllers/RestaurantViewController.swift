//
//  RestaurantViewController.swift
//  Delivery
//
//  Created by Øyvind Hauge on 19/02/2021.
//

import UIKit

final class RestaurantViewController: UIViewController {
    
    private lazy var restaurantImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "restaurant-placeholder.png"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var infoWrapperView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.Text.primary
        label.text = "Restaurant #1"
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private lazy var orderButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.Button.primary
        button.addTarget(self, action: #selector(createOrder), for: .touchUpInside)
        button.setTitle("Order", for: .normal)
        return button
    }()
    
    private var restaurant: Restaurant
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
        super.init(nibName: nil, bundle: nil)
        self.nameLabel.text = restaurant.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildViews()
    }
    
    private func setupChildViews() {
        view.addSubview(restaurantImageView)
        view.addSubview(infoWrapperView)
        infoWrapperView.addSubview(nameLabel)
        infoWrapperView.addSubview(tableView)
        infoWrapperView.addSubview(orderButton)
        
        NSLayoutConstraint.activate([
            restaurantImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            restaurantImageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            restaurantImageView.topAnchor.constraint(equalTo: view.topAnchor),
            restaurantImageView.heightAnchor.constraint(equalToConstant: 200),
            infoWrapperView.leftAnchor.constraint(equalTo: view.leftAnchor),
            infoWrapperView.rightAnchor.constraint(equalTo: view.rightAnchor),
            infoWrapperView.topAnchor.constraint(equalTo: restaurantImageView.bottomAnchor),
            infoWrapperView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            nameLabel.leftAnchor.constraint(equalTo: infoWrapperView.leftAnchor, constant: 16),
            nameLabel.rightAnchor.constraint(equalTo: infoWrapperView.rightAnchor, constant: -16),
            nameLabel.topAnchor.constraint(equalTo: infoWrapperView.topAnchor, constant: 16),
            tableView.leftAnchor.constraint(equalTo: infoWrapperView.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: infoWrapperView.rightAnchor),
            tableView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            //tableView.bottomAnchor.constraint(equalTo: infoWrapperView.bottomAnchor),
            orderButton.leftAnchor.constraint(equalTo: infoWrapperView.leftAnchor, constant: 16),
            orderButton.rightAnchor.constraint(equalTo: infoWrapperView.rightAnchor, constant: -16),
            orderButton.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            orderButton.bottomAnchor.constraint(equalTo: infoWrapperView.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            orderButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func createOrder() {
        let customerId = Account.current.id
        let food = Food(restaurantId: 80, type: 0, name: "", lowerPrice: 0, normalPrice: 0)
        let request = OrderRequest(customerId: customerId, food: food)
        DeliveryService.Orders.create(request: request) { result in
            switch result {
            case .success(let order):
                print("Order created: \(order)")
                break
            case .failure(let error):
                print("Error creating order: \(error.localizedDescription)")
                break
            }
        }
    }
}
