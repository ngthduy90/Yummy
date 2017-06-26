//
//  YummyViewController.swift
//  Yummy
//
//  Created by Duy Nguyen on 6/25/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import UIKit
import ChameleonFramework
import PKHUD

class YummyViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var businessTableView: UITableView!
    
    fileprivate var searchBar: UISearchBar!
    fileprivate let businessTableHandler = BusinessTableViewHandler()
    
    fileprivate var businessFilters = BusinessFilters()
    fileprivate var needSearchAgain: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initSearchBar()
        assignDelegates()
        renderBusinessTableStyle()
        renderNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.backgroundView.applyGradient(colours: [HexColor("E35959")!, HexColor("FFB199")!], direction: .vertical)
        
        if needSearchAgain {
            needSearchAgain = false
            search(businessFilters.term)
        } else {
            searchBar.becomeFirstResponder()
        }
    }
    
    func search(_ text: String) {
        HUD.flash(.progress)
        businessFilters.term = text
        
        BusinessWorker.search(with: businessFilters) {
            guard let businesses = $0 else {
                HUD.flash(.error, delay: 1.0)
                return
            }
            
            self.businessTableHandler.businesses = businesses
            self.businessTableView.reloadData()
            
            HUD.flash(.success, delay: 0.6)
        }
        
    }

    @IBAction func didTapShowFilterScreen(_ sender: Any) {
        searchBar.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let nextVC = segue.destination as? FilterViewController {
            nextVC.delegate = self
            nextVC.filterTableHandler.businessFilters = self.businessFilters
        }
    }
}

extension YummyViewController: FilterViewControllerDelegate {
    
    func filterViewController(needSearch filter: BusinessFilters) {
        self.businessFilters = filter
        self.needSearchAgain = true
    }
    
    func filterViewController(didCancel viewController: FilterViewController) {
        
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
        businessFilters.term = ""
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
        let cancelButtonAttributes: NSDictionary = [NSForegroundColorAttributeName: UIColor.white]
        UIBarButtonItem.appearance().setTitleTextAttributes(cancelButtonAttributes as? [String : AnyObject], for: .normal)
        
        searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
    }
    
    fileprivate func assignDelegates() {
        businessTableView.delegate = businessTableHandler
        businessTableView.dataSource = businessTableHandler
    }
    
    fileprivate func renderBusinessTableStyle() {
        businessTableView.backgroundColor = UIColor.clear
        businessTableView.separatorStyle = .none
        
        businessTableView.estimatedRowHeight = 400.0
        businessTableView.rowHeight = UITableViewAutomaticDimension
        
        let defaultInsets = UIEdgeInsets(top: 70.0, left: 0.0, bottom: 0.0, right: 0.0)
        businessTableView.contentInset = defaultInsets
        businessTableView.scrollIndicatorInsets = defaultInsets
    }
    
    fileprivate func renderNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.isTranslucent = true
        
        UIApplication.shared.statusBarStyle = .lightContent
    }
}

