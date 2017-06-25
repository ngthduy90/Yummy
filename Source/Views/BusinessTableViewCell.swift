//
//  BusinessTableViewCell.swift
//  Yummy
//
//  Created by Duy Nguyen on 6/25/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import UIKit
import AFNetworking

class BusinessTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backgroundEffectView: UIVisualEffectView!
    @IBOutlet weak var businessImageView: UIImageView!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var milesLabel: UILabel!
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func render() {
        self.layoutIfNeeded()
        
        businessImageView.layer.cornerRadius = 16.0
        backgroundEffectView.layer.cornerRadius = 16.0
        
        businessImageView.layer.borderWidth = 2.0
        businessImageView.layer.borderColor = UIColor.white.cgColor
    }
    
    func display(_ business: Business) {
        self.nameLabel.text = business.name
        self.milesLabel.text = business.distanceInMiles
        self.reviewsLabel.text = "\(business.reviewCount)" + ((business.reviewCount < 2) ? " review" : " reviews")
        self.adressLabel.text = business.location.address
        
        self.businessImageView.setImageWith(business.imageURL!)
        self.ratingImageView.setImageWith(business.ratingImageURL!)
    }

}
