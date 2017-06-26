//
//  FilterSortItem.swift
//  Yummy
//
//  Created by Duy Nguyen on 6/27/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import Foundation

class FilterSortItem {
    
    var mode: YummySortMode
    var rawString: String
    
    init(mode: YummySortMode, text: String) {
        self.mode = mode
        self.rawString = text
    }
}
