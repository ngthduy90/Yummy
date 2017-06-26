//
//  SwitchViewCell.swift
//  Yummy
//
//  Created by Duy Nguyen on 6/27/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import UIKit
import ChameleonFramework

protocol SwitchViewCellDelegate: class {
    func switchView(didChange value: Bool, at indexPath: IndexPath)
}

class SwitchViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var switcher: UISwitch!
    
    var indexPath: IndexPath!
    weak var delegate: SwitchViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func didSwitch(_ sender: Any) {
        delegate?.switchView(didChange: switcher.isOn, at: indexPath)
    }
    
    func render() {
        switcher.onTintColor = HexColor("E35959")!
        switcher.clipsToBounds = true
        switcher.backgroundColor = HexColor("4244A2")!
        switcher.layer.cornerRadius = 16.0
    }

}
