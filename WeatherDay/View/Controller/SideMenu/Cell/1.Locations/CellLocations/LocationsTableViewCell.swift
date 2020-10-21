//
//  LocationsTableViewCell.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/7/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

class LocationsTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var locationNameLabel: UILabel!
    @IBOutlet private weak var showLocationImageView: UIImageView!

    // MARK: - Properties
    var viewModel: LocationsViewModel? {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Functions
    func updateView() {
        guard let viewModel = viewModel else { return }
        locationNameLabel.text = viewModel.historyKey
    }
    
}
