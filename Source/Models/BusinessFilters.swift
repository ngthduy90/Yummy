//
//  BusinessFilters.swift
//  Yummy
//
//  Created by Duy Nguyen on 6/25/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import Foundation

class BusinessFilters {
    
    var term: String = ""
    var sortBy: YummySortMode = .bestMatched
    var categories: [String]?
    var isOfferDeals: Bool = false
    var radius: Double?
    
    func getFormatFilters() -> [String] {
        var filters: [String] = []
        
        if !term.isEmpty {
            filters.append("Search: \(term)")
        }
        
        if let sortByString = formatSortMode() {
            filters.append(sortByString)
        }
        
        if let categories = categories {
            let ctgString = categories.joined(separator: ", ")
            filters.append("Categories: \(ctgString)")
        }
        
        if isOfferDeals {
            filters.append("Offer Deals")
        }
        
        return filters
    }
    
    private func formatSortMode() -> String? {
        let sortText = "Sort by: "
        
        switch sortBy {
            
        case .bestMatched:
            return "\(sortText) Best Matched"
            
        case .distance:
            return "\(sortText) Distance"
            
        case .highestRated:
            return "\(sortText) Highest Rated"
        }
    }
}
