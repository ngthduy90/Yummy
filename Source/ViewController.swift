//
//  ViewController.swift
//  Yummy
//
//  Created by Duy Nguyen on 6/24/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        YummyClient.instance.search(
            with: "Thai",
            sort: YummySortMode.bestMatched,
            categories: nil,
            deals: true) { response -> Void in
                switch response {
                case .success(let result):
                    print(result.rawString() ?? "")
                default:
                    print("ABC")
                }
        }
    }
}

