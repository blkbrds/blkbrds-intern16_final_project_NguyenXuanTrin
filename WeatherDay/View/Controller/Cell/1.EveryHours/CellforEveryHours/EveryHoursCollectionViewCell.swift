//
//  EveryHoursCollectionViewCell.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/28/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

class EveryHoursCollectionViewCell: UICollectionViewCell {

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
        backgroundColor = .gray
        cornerRadius = 15
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func updateView() {
        guard let viewModel = viewModel else { return }
        percentOfRainLabel.text = String(viewModel.percentOfRain) + "%"
        temperatureLabel.text = String(viewModel.temperature) + "º"
        timeEveryHoursLabel.text = String(viewModel.timeEveryHours)
    }
}
