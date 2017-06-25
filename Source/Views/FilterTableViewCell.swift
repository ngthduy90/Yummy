//
//  FilterTableViewCell.swift
//  Yummy
//
//  Created by Duy Nguyen on 6/26/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import UIKit

class FilterTableViewCell: UITableViewCell {

    @IBOutlet weak var mainStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func show() {
        let newView = UIView()
        newView.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        newView.backgroundColor = UIColor.blue
        
        mainStackView.addArrangedSubview(newView)
    }
    
    func hide() {
    }

}
