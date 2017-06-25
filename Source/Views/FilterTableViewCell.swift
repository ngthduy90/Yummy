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
    
    var views: [UIView] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func render() {
        let view = FilterItemsView(frame: CGRect(x: 0.0, y: 0.0, width: mainStackView.bounds.width, height: 60.0))
        view.titleLabel.text = "ABC"
        let compView = UISwitch(frame: CGRect(x: 0.0, y: 0.0, width: 80.0, height: 60.0))
        compView.center = view.dynamicView.center
        view.dynamicView.addSubview(compView)
        
        mainStackView.addArrangedSubview(view)
    }
    
    func hide() {
    }

}
