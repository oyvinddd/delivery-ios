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
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = UIColor.Text.primary
        label.text = "Hello, John D."
        return label
    }()
    
    private lazy var profilePictureView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "profile-picture.png"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
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
        addSubview(profilePictureView)
        
        NSLayoutConstraint.activate([
            topLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            topLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            topLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            topLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            profilePictureView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            profilePictureView.widthAnchor.constraint(equalToConstant: 50),
            profilePictureView.heightAnchor.constraint(equalToConstant: 50),
            profilePictureView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func configureUI() {
        backgroundColor = .white
    }
}
