//
//  FilterServices.swift
//  Yummy
//
//  Created by Duy Nguyen on 6/27/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import Foundation

class FilterServices {
    
    class func fetchSortFilterItems() -> [FilterSortItem] {
        
        return [
            FilterSortItem(mode: .bestMatched, text: "Best Matched"),
            FilterSortItem(mode: .distance, text: "Distance"),
            FilterSortItem(mode: .highestRated, text: "Highest Rated")
        ]
    }
    
    class func fetchDistanceFilterItems() -> [FilterDistanceItem] {
        
        return [
            FilterDistanceItem(distance: nil),
            FilterDistanceItem(distance: 804.67),
            FilterDistanceItem(distance: 1609.34),
            FilterDistanceItem(distance: 4828.02),
            FilterDistanceItem(distance: Constants.MaximumRadius)
            
        ]
    }
}
