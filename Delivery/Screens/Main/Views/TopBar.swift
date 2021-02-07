//
//  TopBar.swift
//  Delivery
//
//  Created by Øyvind Hauge on 23/01/2021.
//

import UIKit

final class TopBar: UIView {
    
    private lazy var topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = UIColor.Text.primary
        label.text = "Hello, John D."
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.Text.secondary
        label.text = "See something you like?"
        return label
    }()
    
    private lazy var profilePictureWrap: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.Text.primary
        view.layer.cornerRadius = 25
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var profilePictureView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "profile-picture.png"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 22
        return imageView
    }()
    
    init(account: Account) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupChildViews()
        configureUI()
        topLabel.text = "Hello, \(account.firstName!)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupChildViews() {
        addSubview(topLabel)
        addSubview(subtitleLabel)
        addSubview(profilePictureWrap)
        profilePictureWrap.addSubview(profilePictureView)
        
        NSLayoutConstraint.activate([
            topLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            topLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            topLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            subtitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            subtitleLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 4),
            subtitleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            profilePictureWrap.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            profilePictureWrap.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            profilePictureWrap.widthAnchor.constraint(equalToConstant: 50),
            profilePictureWrap.heightAnchor.constraint(equalToConstant: 50),
            profilePictureView.leftAnchor.constraint(equalTo: profilePictureWrap.leftAnchor, constant: 3),
            profilePictureView.rightAnchor.constraint(equalTo: profilePictureWrap.rightAnchor, constant: -3),
            profilePictureView.topAnchor.constraint(equalTo: profilePictureWrap.topAnchor, constant: 3),
            profilePictureView.bottomAnchor.constraint(equalTo: profilePictureWrap.bottomAnchor, constant: -3)
        ])
    }
    
    private func configureUI() {
        backgroundColor = .white
    }
}
