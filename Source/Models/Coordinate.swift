//
//  Coordinate.swift
//  Yummy
//
//  Created by Duy Nguyen on 6/25/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import Foundation

struct Coordinate {
    
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    
    var rawString: String {
        get {
            return "\(latitude),\(longitude)"
        }
    }
}
