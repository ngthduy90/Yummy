//
//  Location.swift
//  Yummy
//
//  Created by Duy Nguyen on 6/25/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import Foundation

class Location {
    
    var address: String {
        get {
            return self.displayAddress.joined(separator: ", ")
        }
    }
    
    var displayAddress: [String] = []
    var coordinate: Coordinate
    
    init(listAddess addresses: [String], coordinate coor: Coordinate) {
        self.displayAddress = addresses
        self.coordinate = coor
    }
}
