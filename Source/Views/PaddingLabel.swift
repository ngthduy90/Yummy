//
//  PaddingLabel.swift
//  Yummy
//
//  Created by Duy Nguyen on 6/27/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import UIKit

class PaddingLabel: UILabel {

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: 0, left: 8, bottom: 0, right: 8)
        let newRect = CGRect(origin: rect.origin, size: CGSize(width: rect.width + 16.0, height: rect.height))
        super.drawText(in: UIEdgeInsetsInsetRect(newRect, insets))
    }

}
