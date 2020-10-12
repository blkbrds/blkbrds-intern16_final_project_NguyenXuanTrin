//
//  WeatherTodayTableViewCell.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/30/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import SDWebImage
import UIKit

final class WeatherTodayTableViewCell: UITableViewCell {

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
        weatherShowImage.sd_setImage(with: URL(string: viewModel.url))
        weatherStatusLabel.text = viewModel.weatherStatus
        temperatureMinLabel.text = viewModel.infoWeatherToday(temperature: viewModel.temperatureMin)
        temperatureMaxLabel.text = viewModel.infoWeatherToday(temperature: viewModel.temperatureMax)
        temperatureTodayLabel.text = viewModel.infoWeatherToday(temperature: viewModel.temperatureToday)
    }
}
