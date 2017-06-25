//
//  YummyViewController.swift
//  Yummy
//
//  Created by Duy Nguyen on 6/25/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import UIKit
import ChameleonFramework

class YummyViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var businessTableView: UITableView!
    
    fileprivate var searchBar: UISearchBar!
    fileprivate let businessTableHandler = BusinessTableViewHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initSearchBar()
        assignDelegate()
        renderBusinessTableStyle()
        renderNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.backgroundView.applyGradient(colours: [HexColor("E35959")!, HexColor("FFB199")!], direction: .vertical)
        
        self.searchBar.becomeFirstResponder()
    }
    
    func search(_ text: String) {
        BusinessWorker.search(with: text) {
            self.businessTableHandler.businesses = $0!
            self.businessTableView.reloadData()
        }
        
    }

}

extension YummyViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(false, animated: true)
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        guard let text = searchBar.text else {
            return
        }
        
        search(text)
    }
}

extension YummyViewController {
    
    fileprivate func initSearchBar() {
        searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
    }
    
    fileprivate func assignDelegate() {
        businessTableView.delegate = businessTableHandler
        businessTableView.dataSource = businessTableHandler
    }
    
    fileprivate func renderBusinessTableStyle() {
        businessTableView.backgroundColor = UIColor.clear
        businessTableView.separatorStyle = .none
        
        businessTableView.estimatedRowHeight = 400.0
        businessTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    fileprivate func renderNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.isTranslucent = true
        
        UIApplication.shared.statusBarStyle = .lightContent
    }
}

