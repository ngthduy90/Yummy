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
        
        if isOfferDeals {
            filters.append("Offer Deals")
        }
        
        if let sortByString = sortModeAsString() {
            filters.append("Sort by: \(sortByString)")
        }
        
        filters.append("Distance: \(distanceAsString())")
        
        if let categories = categories {
            let ctgString = categories.joined(separator: ", ")
            filters.append("Categories: \(ctgString)")
        }
        
        return filters
    }
    
    func sortModeAsString() -> String? {
        
        switch sortBy {
            
        case .bestMatched:
            return "Best Matched"
            
        case .distance:
            return "Distance"
            
        case .highestRated:
            return "Highest Rated"
        }
    }
    
    func distanceAsString() -> String {
        guard let value = radius else {
            return "Auto"
        }
        
        return String(format: "%.2f miles", Constants.MilesPerMeter * value)
    }
}
