//
//  Business.swift
//  Yummy
//
//  Created by Duy Nguyen on 6/25/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import Foundation
import SwiftyJSON

class Business {
    
    static let milesPerMeter = 0.000621371
    
    var name: String = ""
    var distance: Double = 0.0
    var reviewCount: Int = 0
    
    var imageURL: URL?
    var ratingImageURL: URL?
    
    var categories: String = ""
    var location: Location
    
    init(fromJSON json: JSON) {
        
        let addresses = json["location"]["display_address"].arrayValue.map { $0.stringValue }
        
        let coorJSON = json["location"]["coordinate"]
        let latValue = coorJSON["latitude"].doubleValue
        let longValue = coorJSON["longitude"].doubleValue
        
        self.location = Location(listAddess: addresses, coordinate: Coordinate(latitude: latValue, longitude: longValue))
        self.name = json["name"].stringValue
        self.distance = json["distance"].doubleValue
        self.reviewCount = json["review_count"].intValue
        
        self.imageURL = json["image_url"].url
        self.ratingImageURL = json["rating_img_url_large"].url
    }
    
    var distanceInMiles: String {
        get {
            return String(format: "%.2f mi", Business.milesPerMeter * distance)
        }
    }
}
