//
//  DailyTableViewCell.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/29/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class DailyTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var dayOfWeekLabel: UILabel!
    @IBOutlet private weak var showWeatherImageView: UIImageView!
    @IBOutlet private weak var percentHumidityLabel: UILabel!
    @IBOutlet private weak var temperatureMinLabel: UILabel!
    @IBOutlet private weak var temperatureMaxLabel: UILabel!

    // MARK: - Properties
    var viewModel: DailyTableCellViewModel? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        guard let viewModel = viewModel else { return }
        dayOfWeekLabel.text = viewModel.dayOfWeek
        percentHumidityLabel.text = String(viewModel.percentHumidity) + "%"
        temperatureMinLabel.text = String(viewModel.temperatureMin) + "º"
        temperatureMaxLabel.text = String(viewModel.temperatureMax) + "º"
    }
}
