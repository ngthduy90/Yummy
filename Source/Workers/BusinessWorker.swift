//
//  BusinessWorker.swift
//  Yummy
//
//  Created by Duy Nguyen on 6/25/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import Foundation

class BusinessWorker {
    
    class func search(with filters: BusinessFilters, completion: @escaping ([Business]?) -> Void) {
        
        YummyClient.instance.search(
            with: filters.term,
            sort: filters.sortBy,
            categories: filters.categories,
            deals: filters.isOfferDeals,
            distance: filters.radius) { response -> Void in
                switch response {
                    
                case .success(let result):
                    let businesses = result["businesses"].arrayValue.map {
                        Business(fromJSON: $0)
                    }
                    completion(businesses)
                    
                default:
                    completion(nil)
                }
        }
    }
}
