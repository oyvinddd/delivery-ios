//
//  RestaurantTableViewCell.swift
//  Delivery
//
//  Created by Øyvind Hauge on 21/01/2021.
//

import UIKit

final class RestaurantTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: RestaurantTableViewCell.self)
    }
    
    private lazy var wrapperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var restaurantImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello, world!"
        return label
    }()
    
    var restaurant: Restaurant? {
        didSet {
            guard let restaurant = restaurant else { return }
            titleLabel.text = restaurant.title
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupChildViews()
        //configureUI()
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupChildViews() {
        addSubview(wrapperView)
        wrapperView.addSubview(restaurantImageView)
        wrapperView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            wrapperView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            wrapperView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            wrapperView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            wrapperView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
        ])
    }
}
