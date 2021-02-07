//
//  Coordinates.swift
//  Delivery
//
//  Created by Øyvind Hauge on 07/02/2021.
//

import Foundation

struct Coordinates {
    var lat, long: Float
    
    init(_ lat: Float, _ long: Float) {
        self.lat = lat
        self.long = long
    }
}
