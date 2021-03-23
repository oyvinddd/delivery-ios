//
//  OfferCollectionViewCell.swift
//  Delivery
//
//  Created by Øyvind Hauge on 23/03/2021.
//

import UIKit

final class OfferCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OfferCollectionViewCell.self)
    
    var offer: SpecialOffer? {
        didSet {
            
        }
    }
    
    private lazy var wrapperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.Offer.one
        view.applyCornerRadius(12)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupChildViews()
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupChildViews() {
        addSubview(wrapperView)
        
        NSLayoutConstraint.activate([
            wrapperView.leftAnchor.constraint(equalTo: leftAnchor),
            wrapperView.rightAnchor.constraint(equalTo: rightAnchor),
            wrapperView.topAnchor.constraint(equalTo: topAnchor),
            wrapperView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
