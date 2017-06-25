//
//  BusinessTableViewHandler.swift
//  Yummy
//
//  Created by Duy Nguyen on 6/25/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import UIKit

class BusinessTableViewHandler: NSObject {
    
    let businessCell = "BusinessCell"
    
    var businesses: [Business] = []
    
}

extension BusinessTableViewHandler: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
}

extension BusinessTableViewHandler: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businesses.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: businessCell, for: indexPath) as! BusinessTableViewCell
        
        cell.render()
        cell.display(businesses[indexPath.row])
        
        return cell
    }
}
