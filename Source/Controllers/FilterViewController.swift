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
}

class FilterViewController: UIViewController {
    
    @IBOutlet weak var filterTableView: UITableView!
    
    weak var delegate: FilterViewControllerDelegate?
    
    var businessFilters = BusinessFilters()
    fileprivate let filterTableHandler = FilterTableViewHandler()

    override func viewDidLoad() {
        super.viewDidLoad()

        renderNavigationBar()
        assignDelegates()
        renderFilterTable()
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
    }
    
    fileprivate func renderFilterTable() {
        filterTableView.separatorStyle = .none
//        filterTableView.estimatedRowHeight = 400.0
//        filterTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    fileprivate func renderNavigationBar() {
        let backgroundImage = UIImage(color: HexColor("E35959")!, size: (navigationController?.navigationBar.frame.size)!)
        navigationController?.navigationBar.setBackgroundImage(backgroundImage, for: .default)
        navigationController?.navigationBar.isTranslucent = true
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    
}
