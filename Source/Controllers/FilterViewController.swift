//
//  FilterViewController.swift
//  Yummy
//
//  Created by Duy Nguyen on 6/26/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import UIKit
import ChameleonFramework

protocol FilterViewControllerDelegate: class {
    
    func filterViewController(didCancel viewController: FilterViewController)
    
    func filterViewController(needSearch filter: BusinessFilters)
}

class FilterViewController: UIViewController {
    
    @IBOutlet weak var filterTableView: UITableView!
    
    weak var delegate: FilterViewControllerDelegate?
    let filterTableHandler = FilterTableViewHandler()

    override func viewDidLoad() {
        super.viewDidLoad()

        renderNavigationBar()
        assignDelegates()
        renderFilterTable()
    }
    
    @IBAction func didTapSearch(_ sender: Any) {
        
        self.delegate?.filterViewController(needSearch: filterTableHandler.businessFilters)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapDismissScreen(_ sender: Any) {
        
        self.delegate?.filterViewController(didCancel: self)
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension FilterViewController {
    
    fileprivate func assignDelegates() {
        filterTableView.delegate = filterTableHandler
        filterTableView.dataSource = filterTableHandler
        filterTableHandler.filterTableView = filterTableView
    }
    
    fileprivate func renderFilterTable() {
        filterTableView.separatorStyle = .none
        filterTableView.allowsMultipleSelection = false
        filterTableView.allowsSelection = false
    }
    
    fileprivate func renderNavigationBar() {
        let backgroundImage = UIImage(color: HexColor("E35959")!, size: (navigationController?.navigationBar.frame.size)!)
        navigationController?.navigationBar.setBackgroundImage(backgroundImage, for: .default)
        navigationController?.navigationBar.isTranslucent = true
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    
}
