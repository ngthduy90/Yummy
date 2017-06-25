//
//  FilterItemView.swift
//  Yummy
//
//  Created by Duy Nguyen on 6/26/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import UIKit

class FilterItemsView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dynamicView: UIView!
    
    @IBOutlet weak var dynamicViewWidthConstraint: NSLayoutConstraint!
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    @IBAction func didTapItem(_ sender: Any) {
        
    }
    
    
    // MARK: - Private Helper Methods
    
    // Performs the initial setup.
    fileprivate func setupView() {
        let view = viewFromNibForClass()
        view.frame = bounds
        view.autoresizingMask = [
            UIViewAutoresizing.flexibleWidth,
            UIViewAutoresizing.flexibleHeight
        ]
        addSubview(view)
    }
    
    // Loads a XIB file into a view and returns this view.
    fileprivate func viewFromNibForClass() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }

}
