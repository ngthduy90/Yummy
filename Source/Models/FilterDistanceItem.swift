//
//  FilterDistanceItem.swift
//  Yummy
//
//  Created by Duy Nguyen on 6/27/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import Foundation

class FilterDistanceItem {
    
    var distanceInMiles: String {
        get {
            guard let value = rawValue else {
                return "Auto"
            }
            
            return String(format: "%.01f miles", Constants.MilesPerMeter * value)
        }
    }
    
    var rawValue: Double?
    
    init(distance: Double?) {
        self.rawValue = distance
    }
}
