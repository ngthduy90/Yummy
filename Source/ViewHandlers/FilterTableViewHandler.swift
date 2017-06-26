//
//  FilterTableViewHandler.swift
//  Yummy
//
//  Created by Duy Nguyen on 6/26/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import UIKit
import ChameleonFramework

class FilterTableViewHandler: NSObject {
    
    var businessFilters = BusinessFilters()
    weak var filterTableView: UITableView?
    
    fileprivate let imageViewCell = "CellWithImageView"
    fileprivate let switchViewCell = "CellWithSwitch"
    
    fileprivate var noDistanceRows: Int = 1
    fileprivate var noSortByRows: Int = 1
    
    fileprivate var isExpandSortByItems = false
    fileprivate var isExpandDistanceItems = false
    
    fileprivate let sortItems = FilterServices.fetchSortFilterItems()
    fileprivate let distanceItems = FilterServices.fetchDistanceFilterItems()

}

extension FilterTableViewHandler: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
        
        switch section {
            
        case FilterSection.sortBy.rawValue:
            return noSortByRows
            
        case FilterSection.distance.rawValue:
            return noDistanceRows
            
        case FilterSection.categories.rawValue:
            return 0
            
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
            
        case FilterSection.deals.rawValue:
            return dequeueDealsCell(of: tableView, at: indexPath)
            
        case FilterSection.sortBy.rawValue:
            return dequeueSortByCell(of: tableView, at: indexPath)
            
        case FilterSection.distance.rawValue:
            return dequeueDistanceCell(of: tableView, at: indexPath)
            
        case FilterSection.categories.rawValue:
            return UITableViewCell()
            
        default:
            return UITableViewCell()
        }
    }
}

fileprivate enum FilterSection: Int {
    case deals = 0, sortBy, distance, categories
}

extension FilterTableViewHandler: SwitchViewCellDelegate {
    
    func switchView(didChange value: Bool, at indexPath: IndexPath) {
        
        switch indexPath.section {
            
        case FilterSection.deals.rawValue:
            businessFilters.isOfferDeals = value
            break
            
        default:
            break
        }
    }
}

extension FilterTableViewHandler: ImageViewCellDelegate {

    func imageCell(_ cell: ImageViewCell, didChoose value: Any?, at indexPath: IndexPath) {
        
        switch indexPath.section {
            
        case FilterSection.sortBy.rawValue:
            if isExpandSortByItems {
                uncheckAllItems(of: sortItems, at: indexPath.section)
                cell.iconImageView.image = UIImage(named: "checked")
                businessFilters.sortBy = (value as? YummySortMode) ?? .bestMatched
                
            } else {
                isExpandSortByItems = true
                noSortByRows = sortItems.count
                filterTableView?.reloadSections(IndexSet(integer: indexPath.section), with: .automatic)
            }
            
            break
            
        case FilterSection.distance.rawValue:
            if isExpandDistanceItems {
                uncheckAllItems(of: distanceItems, at: indexPath.section)
                cell.iconImageView.image = UIImage(named: "checked")
                businessFilters.radius = value as? Double
                
            } else {
                isExpandDistanceItems = true
                noDistanceRows = distanceItems.count
                filterTableView?.reloadSections(IndexSet(integer: indexPath.section), with: .automatic)
            }
            
            break
            
        default:
            break
        }
    }
    
    private func uncheckAllItems(of items: [Any], at section: Int) {
        
        for index in 0..<items.count {
            if let cell = filterTableView?.cellForRow(at: IndexPath(row: index, section: section)) as? ImageViewCell {
                cell.iconImageView.image = UIImage(named: "uncheck")
            }
        }
    }
}

extension FilterTableViewHandler {
    
    fileprivate func dequeueDealsCell(of tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: switchViewCell, for: indexPath) as! SwitchViewCell
        
        cell.delegate = self
        cell.indexPath = indexPath
        cell.render()
        
        cell.title.text = "Only show offering"
        cell.switcher.isOn = businessFilters.isOfferDeals
        
        return cell
    }
    
    fileprivate func dequeueSortByCell(of tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: imageViewCell, for: indexPath) as! ImageViewCell
        
        cell.delegate = self
        cell.indexPath = indexPath
        
        if isExpandSortByItems {
            let item = sortItems[indexPath.row]
            cell.title.text = item.rawString
            cell.iconImageView.image = UIImage(named: "uncheck")
            cell.itemValue = item.mode
            
        } else {
            cell.title.text = businessFilters.sortModeAsString() ?? ""
            cell.iconImageView.image = UIImage(named: "downArrow")
        }
        
        return cell
    }
    
    fileprivate func dequeueDistanceCell(of tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: imageViewCell, for: indexPath) as! ImageViewCell
        
        cell.delegate = self
        cell.indexPath = indexPath
        
        if isExpandDistanceItems {
            let item = distanceItems[indexPath.row]
            cell.title.text = item.distanceInMiles
            cell.iconImageView.image = UIImage(named: "uncheck")
            cell.itemValue = item.rawValue
            
        } else {
            cell.title.text = businessFilters.distanceAsString()
            cell.iconImageView.image = UIImage(named: "downArrow")
        }
        
        return cell
    }
}
