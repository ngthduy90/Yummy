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
    
    weak var delegate: FilterViewControllerDelegate?
    
    var businessFilters = BusinessFilters()

    override func viewDidLoad() {
        super.viewDidLoad()

        renderNavigationBar()
    }
    
    @IBAction func didTapDismissScreen(_ sender: Any) {
        self.delegate?.filterViewController(didCancel: self)
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension FilterViewController {
    
    fileprivate func renderNavigationBar() {
        let backgroundImage = UIImage(color: HexColor("E35959")!, size: (navigationController?.navigationBar.frame.size)!)
        navigationController?.navigationBar.setBackgroundImage(backgroundImage, for: .default)
        navigationController?.navigationBar.isTranslucent = true
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    
}
