//
//  FilterTableViewCell.swift
//  Yummy
//
//  Created by Duy Nguyen on 6/26/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import UIKit

protocol ImageViewCellDelegate: class {
    func imageCell(_ cell: ImageViewCell, didChoose value: Any?, at indexPath: IndexPath)
}

class ImageViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    weak var delegate: ImageViewCellDelegate?
    var indexPath: IndexPath!
    
    var itemValue: Any?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func didTapOnCell(_ sender: Any) {
        delegate?.imageCell(self, didChoose: itemValue, at: indexPath)
    }

}
