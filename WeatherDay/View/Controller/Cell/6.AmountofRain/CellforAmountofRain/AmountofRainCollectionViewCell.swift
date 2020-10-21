//
//  AmountofRainCollectionViewCell.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/2/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class AmountofRainCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var statusRainLabel: UILabel!
    @IBOutlet private weak var showAmountofRainImageView: UIImageView!
    @IBOutlet private weak var humidityLabel: UILabel!
    
    // MARK: - Properties
    var viewModel: AmountofRainCollectionViewModel? {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Private functions
    private func updateView() {
        guard let viewModel = viewModel else { return }
        statusRainLabel.text = viewModel.statusRain
        humidityLabel.text = String(viewModel.humidity) + "%"
    }

}
