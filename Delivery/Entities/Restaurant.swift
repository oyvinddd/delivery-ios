//
//  Restaurant.swift
//  Delivery
//
//  Created by Øyvind Hauge on 21/01/2021.
//

import Foundation

struct Restaurant: Codable {
    var id: Int
    var name: String
    var position: Coordinates
    var menu: [Food]
}
