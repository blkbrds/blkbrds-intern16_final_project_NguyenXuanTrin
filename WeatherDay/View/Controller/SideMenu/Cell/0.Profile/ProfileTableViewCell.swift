//
//  ProfileTableViewCell.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/7/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    // MARK: IBOutlets
    @IBOutlet private weak var searchCitySwitch: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
        if !searchCitySwitch.isOn {
            
        }
    }

    @IBAction func searchCitySwitchValueChange(_ sender: UISwitch) {
    }
}
