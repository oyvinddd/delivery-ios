//
//  UIView+Visuals.swift
//  Delivery
//
//  Created by Øyvind Hauge on 23/03/2021.
//

import UIKit

extension UIView {
    
    func applyDropShadow() {
        layer.shadowColor = UIColor.Text.secondary.cgColor
        layer.masksToBounds = false
        layer.shadowRadius = 10.0
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 0.0, height: 8.0)
    }
    
    func applyCornerRadius(_ radius: CGFloat = 6) {
        layer.masksToBounds = true
        layer.cornerRadius = radius
    }
}
