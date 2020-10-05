//
//  DetailsOfDayCell.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/28/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

class DetailsOfDayCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var weatherShowImageView: UIImageView!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var humidityLabel: UILabel!
    @IBOutlet private weak var visibilityLabel: UILabel!
    @IBOutlet private weak var uvIndexLabel: UILabel!
    @IBOutlet private weak var dewpointLabel: UILabel!
    
    // MARK: - Properties
    var viewModel: DetailsOfDayViewModel? {
        didSet {
            updateView()
        }
    }

    // MARK: - Private Functions
    private func updateView() {
        guard let viewModel = viewModel else { return }
        temperatureLabel.text = viewModel.infoTempDaily(temperature: viewModel.temperature)
        humidityLabel.text = viewModel.infoHumidityDaily(humidity: viewModel.humidity)
        visibilityLabel.text = viewModel.infoVisibilityDaily(visibility: viewModel.visibility)
        uvIndexLabel.text = viewModel.uvIndex
        dewpointLabel.text = viewModel.infoTempDaily(temperature: viewModel.dewpoint)
    }
}
