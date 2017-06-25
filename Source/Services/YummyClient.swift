//
//  YummyClient.swift
//  Yummy
//
//  Created by Duy Nguyen on 6/24/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import Foundation
import OAuthSwift
import SwiftyJSON

struct YummyAPIConsole {
    var consumerKey = "vxKwwcR_NMQ7WaEiQBK_CA"
    var consumerSecret = "33QCvh5bIF5jIHR5klQr7RtBDhQ"
    var accessToken = "uRcRswHFYa1VkDrGV6LAW2F8clGh5JHV"
    var accessTokenSecret = "mqtKIxMIR4iBtBPZCmCLEb-Dz3Y"
}

enum YummySortMode: Int {
    case bestMatched = 0, distance, highestRated
}

enum YummyResponse {
    case success(JSON), error(Error), empty
}

class YummyClient {
    
    static let instance = YummyClient()
    
    let baseUrl = "https://api.yelp.com/v2/"
    let defaultLocation:Coordinate = Coordinate(latitude: 37.785771, longitude: -122.406165)
    
    let clientOAuth: OAuthSwiftClient?
    let apiConsoleInfo = YummyAPIConsole()
    
    private init() {
        self.clientOAuth = OAuthSwiftClient(consumerKey: apiConsoleInfo.consumerKey,
                                            consumerSecret: apiConsoleInfo.consumerSecret,
                                            oauthToken: apiConsoleInfo.accessToken,
                                            oauthTokenSecret: apiConsoleInfo.accessTokenSecret,
                                            version: .oauth1)
    }
    
    func search(with term: String,
                sort: YummySortMode?,
                categories: [String]?,
                deals: Bool?,
                distance: Double?,
                completion: @escaping (YummyResponse) -> ()) {
        
        var parameters: [String : Any] = ["term": term, "ll": defaultLocation.rawString]
        
        if sort != nil {
            parameters["sort"] = sort!.rawValue
        }
        
        if categories != nil && categories!.count > 0 {
            parameters["category_filter"] = (categories!).joined(separator: ",")
        }
        
        if let deals = deals {
            parameters["deals_filter"] = deals
        }
        
        if let radius = distance {
            parameters["radius_filter"] = Double.minimum(radius, Constants.MaximumRadius)
        }
        
        let _ = self.clientOAuth?.get("\(self.baseUrl)search/",
            
            parameters: parameters,
            
            success: { response -> Void in
                guard let jsonString = response.dataString() else {
                    completion(YummyResponse.empty)
                    return
                }
                
                if let dataFromString = jsonString.data(using: .utf8, allowLossyConversion: false) {
                    completion(.success(JSON(data: dataFromString)))
                } else {
                    completion(YummyResponse.empty)
                }
                
        }, failure: { error -> Void in completion(.error(error)) })
    }
}
