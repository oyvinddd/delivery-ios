//
//  RestaurantTableViewCell.swift
//  Delivery
//
//  Created by Øyvind Hauge on 21/01/2021.
//

import UIKit

final class RestaurantTableViewCell: UITableViewCell {
    
    private lazy var wrapperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        //view.clipsToBounds = true
        view.applyCornerRadius(10)
        view.applyDropShadow()
        return view
    }()
    
    private lazy var restaurantImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return imageView
    }()
    
    private lazy var openStatusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.backgroundColor = UIColor.Text.primary
        label.textColor = .white
        label.textAlignment = .center
        label.alpha = 0.9
        //label.inse = UIEdgeInsetsMake(0, 0, 5, 0)
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.Text.primary
        return label
    }()
    
    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.Text.secondary
        return label
    }()
    
    var restaurant: Restaurant? {
        didSet {
            guard let restaurant = restaurant else { return }
            restaurantImageView.image = UIImage(named: "placeholder.png")
            titleLabel.text = restaurant.name
            addressLabel.text = "Damsgårdsveien 105, 5058 Bergen"
            openStatusLabel.text = "open".uppercased()
        }
    }
    
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
        addSubview(wrapperView)
        wrapperView.addSubview(restaurantImageView)
        wrapperView.addSubview(openStatusLabel)
        wrapperView.addSubview(titleLabel)
        wrapperView.addSubview(addressLabel)
        
        NSLayoutConstraint.activate([
            wrapperView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            wrapperView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            wrapperView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            wrapperView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            restaurantImageView.leftAnchor.constraint(equalTo: wrapperView.leftAnchor),
            restaurantImageView.rightAnchor.constraint(equalTo: wrapperView.rightAnchor),
            restaurantImageView.topAnchor.constraint(equalTo: wrapperView.topAnchor),
            restaurantImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 60),
            restaurantImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 110),
            openStatusLabel.leftAnchor.constraint(equalTo: wrapperView.leftAnchor, constant: 12),
            openStatusLabel.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 12),
            titleLabel.leftAnchor.constraint(equalTo: wrapperView.leftAnchor, constant: 12),
            titleLabel.rightAnchor.constraint(equalTo: wrapperView.rightAnchor, constant: -12),
            titleLabel.topAnchor.constraint(equalTo: restaurantImageView.bottomAnchor, constant: 12),
            addressLabel.leftAnchor.constraint(equalTo: wrapperView.leftAnchor, constant: 12),
            addressLabel.rightAnchor.constraint(equalTo: wrapperView.rightAnchor, constant: -12),
            addressLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            addressLabel.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor, constant: -12)
        ])
    }
    
    private func scaledImage() -> UIImage {
        let image = UIImage(named: "placeholder.png")!
        let newSize = CGSize(width: 420, height: 250)
        return image.scalePreservingAspectRatio(targetSize: newSize)
    }
}
