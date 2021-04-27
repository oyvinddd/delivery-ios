//
//  Food.swift
//  Delivery
//
//  Created by Øyvind Hauge on 07/02/2021.
//

import Foundation

struct Food: Codable {
    var type: Int
    var name: String
    var lowerPrice: Int
    var normalPrice: Int
}
