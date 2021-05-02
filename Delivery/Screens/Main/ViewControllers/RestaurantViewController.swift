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
    
    private lazy var backButtonView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        let imageView = UIImageView(image: UIImage(named: "back-arrow.png"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 6),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8)
        ])
        view.isUserInteractionEnabled = true
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(backButtonTapped))
        view.addGestureRecognizer(recognizer)
        view.applyCornerRadius(18)
        return view
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
        return label
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = UIColor.Text.secondary
        label.text = "⭐️⭐️⭐️⭐️⭐️ 5.0 (500+ reviews)"
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor.TableView.background
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        tableView.allowsMultipleSelection = false
        tableView.registerCell(FoodTableViewCell.self)
        return tableView
    }()
    
    private lazy var orderButton: UIButton = {
        let button = UIButton.create(with: "Order", backgroundColor: UIColor.Button.primary)
        button.addTarget(self, action: #selector(createOrder), for: .touchUpInside)
        return button
    }()
    
    private var restaurant: Restaurant
    private var selectedFood: Food?
    
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
        configureUI()
    }
    
    private func setupChildViews() {
        view.addSubview(restaurantImageView)
        view.addSubview(backButtonView)
        view.addSubview(infoWrapperView)
        infoWrapperView.addSubview(nameLabel)
        infoWrapperView.addSubview(ratingLabel)
        infoWrapperView.addSubview(tableView)
        infoWrapperView.addSubview(orderButton)
        
        NSLayoutConstraint.activate([
            restaurantImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            restaurantImageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            restaurantImageView.topAnchor.constraint(equalTo: view.topAnchor),
            restaurantImageView.heightAnchor.constraint(equalToConstant: 190),
            backButtonView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            backButtonView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            backButtonView.widthAnchor.constraint(equalToConstant: 36),
            backButtonView.heightAnchor.constraint(equalTo: backButtonView.widthAnchor),
            infoWrapperView.leftAnchor.constraint(equalTo: view.leftAnchor),
            infoWrapperView.rightAnchor.constraint(equalTo: view.rightAnchor),
            infoWrapperView.topAnchor.constraint(equalTo: restaurantImageView.bottomAnchor, constant: -32),
            infoWrapperView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            nameLabel.leftAnchor.constraint(equalTo: infoWrapperView.leftAnchor, constant: 16),
            nameLabel.rightAnchor.constraint(equalTo: infoWrapperView.rightAnchor, constant: -16),
            nameLabel.topAnchor.constraint(equalTo: infoWrapperView.topAnchor, constant: 16),
            ratingLabel.leftAnchor.constraint(equalTo: infoWrapperView.leftAnchor, constant: 16),
            ratingLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            ratingLabel.rightAnchor.constraint(equalTo: infoWrapperView.rightAnchor, constant: -16),
            tableView.leftAnchor.constraint(equalTo: infoWrapperView.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: infoWrapperView.rightAnchor),
            tableView.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 16),
            orderButton.leftAnchor.constraint(equalTo: infoWrapperView.leftAnchor, constant: 16),
            orderButton.rightAnchor.constraint(equalTo: infoWrapperView.rightAnchor, constant: -16),
            orderButton.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            orderButton.bottomAnchor.constraint(equalTo: infoWrapperView.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            orderButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureUI() {
        infoWrapperView.layer.masksToBounds = true
        infoWrapperView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        infoWrapperView.layer.cornerRadius = 20
    }
    
    @objc private func createOrder() {
        guard let food = selectedFood else {
            return
        }
        let request = OrderRequest(customerId: Account.current.id, food: food)
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
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

extension RestaurantViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurant.menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: FoodTableViewCell.self, for: indexPath)
        cell.food = restaurant.menu[indexPath.row]
        return cell
    }
}

extension RestaurantViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectFood(with: indexPath)
    }
    
    private func selectFood(with indexPath: IndexPath) {
        let food = restaurant.menu[indexPath.row]
        selectedFood = food
        orderButton.setTitle("Order (\(food.normalPrice) NOK)".uppercased(), for: .normal)
    }
}
