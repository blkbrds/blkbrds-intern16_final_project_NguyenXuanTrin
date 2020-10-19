//
//  ProfileTableViewCell.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/7/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var searchCitySwitch: UISwitch!

    // MARK: - Properties
    var check: Bool = true
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func searchCitySwitchValueChange(_ sender: UISwitch) {
        if searchCitySwitch.isOn != true {
            self.check = false
            UserDefaults.standard.set(check, forKey: "CheckListSearch")
        } else {
            self.check = true
            UserDefaults.standard.set(check, forKey: "CheckListSearch")
        }
    }
    
}
