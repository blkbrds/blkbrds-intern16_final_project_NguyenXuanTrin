//
//  EveryHoursCollectionViewCell.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/28/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class EveryHoursCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var percentOfRainLabel: UILabel!
    @IBOutlet private weak var weatherShowEveryHoursImageView: UIImageView!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var timeEveryHoursLabel: UILabel!

    var viewModel: EveryHoursCollectionViewViewModel? {
        didSet {
            updateView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    private func configView() {
        cornerRadius = 10
    }
    
    func updateView() {
        guard let viewModel = viewModel else { return }
        weatherShowEveryHoursImageView.sd_setImage(with: URL(string: viewModel.url))
        percentOfRainLabel.text = String(viewModel.percentOfRain) + "%"
        temperatureLabel.text = String(viewModel.temperature) + "º"
        timeEveryHoursLabel.text = String(viewModel.numbers) + ":00"
    }
}
