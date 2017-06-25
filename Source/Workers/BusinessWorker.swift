//
//  BusinessWorker.swift
//  Yummy
//
//  Created by Duy Nguyen on 6/25/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import Foundation

class BusinessWorker {
    
    class func search(with term: String, completion: @escaping ([Business]?) -> Void) {
        
        YummyClient.instance.search(
            with: term,
            sort: YummySortMode.bestMatched,
            categories: nil,
            deals: false) { response -> Void in
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
