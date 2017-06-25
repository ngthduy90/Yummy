//
//  FilterTableViewHandler.swift
//  Yummy
//
//  Created by Duy Nguyen on 6/26/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import UIKit

class FilterTableViewHandler: NSObject {
    
    let filterCell = "FilterCell"
    
    fileprivate var isExpand = false

}

extension FilterTableViewHandler: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        isExpand = true
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.right)
    }
}

extension FilterTableViewHandler: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case FilterSection.deals.rawValue:
            return "Deals"
        case FilterSection.sortBy.rawValue:
            return "Sort by"
        case FilterSection.distance.rawValue:
            return "Distance"
        case FilterSection.categories.rawValue:
            return "Categories"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
            
        case FilterSection.sortBy.rawValue:
            return 200.0
            
        case FilterSection.distance.rawValue:
            return 200.0
            
        case FilterSection.categories.rawValue:
            return 600.0
            
        default:
            return 100.0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: filterCell, for: indexPath) as! FilterTableViewCell
        
        if isExpand {
            cell.show()
            isExpand = false
        }
        
        return cell
    }
}

fileprivate enum FilterSection: Int {
    case deals = 0, sortBy, distance, categories
}
