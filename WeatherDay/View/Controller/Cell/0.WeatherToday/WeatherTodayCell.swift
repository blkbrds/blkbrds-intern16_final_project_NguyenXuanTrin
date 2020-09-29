//
//  WeatherTodayCell.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/27/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

class WeatherTodayCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var weatherShowImage: UIImageView!
    @IBOutlet private weak var weatherStatusLabel: UILabel!
    @IBOutlet private weak var temperatureMinLabel: UILabel!
    @IBOutlet private weak var temperatureMaxLabel: UILabel!
    @IBOutlet private weak var temperatureTodayLabel: UILabel!

    // MARK: - Properties
    var viewModel: WeatherTodayViewModel? {
        didSet {
            updateView()
        }
    }

    // MARK: - Private Functions
    private func updateView() {
        guard let viewModel = viewModel else { return }
        weatherStatusLabel.text = viewModel.weatherStatus
        temperatureMinLabel.text = String(viewModel.temperatureMin) + "º"
        temperatureMaxLabel.text = String(viewModel.temperatureMax) + "º"
        temperatureTodayLabel.text = String(viewModel.temperatureToday) + "º"
    }
}
