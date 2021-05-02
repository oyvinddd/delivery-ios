//
//  SpecialOfferTableViewCell.swift
//  Delivery
//
//  Created by Øyvind Hauge on 21/03/2021.
//

import UIKit

private let kCollectionViewCellWidth: CGFloat = 120
private let kCollectionViewCellHeight: CGFloat = 140

final class SpecialOfferTableViewCell: UITableViewCell {
    
    private lazy var collectionView: UICollectionView = {
        // collection view layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kCollectionViewCellWidth, height: kCollectionViewCellHeight)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(OfferCollectionViewCell.self,
                                forCellWithReuseIdentifier: OfferCollectionViewCell.identifier)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        return collectionView
    }()
    
    var offers: [SpecialOffer] = []
    
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
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: kCollectionViewCellHeight)
        ])
    }
}

// MARK: - Collection View Data Source

extension SpecialOfferTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return offers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: OfferCollectionViewCell.self, for: indexPath)
        cell.offer = offers[indexPath.row]
        return cell
    }
}
