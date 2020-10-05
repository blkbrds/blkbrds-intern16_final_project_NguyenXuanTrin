//
//  SunandWindTableViewCell.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/1/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class SunandWindTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    // MARK: - Properties
    var viewModel: SunandWindTableViewModel? {
        didSet {
            guard let astronomy = viewModel?.astronomy else { return }
            configUI(sunrise: astronomy.sunrise, sunset: astronomy.sunset)
        }
    }

    // MARK: - Life cycle
    override func prepareForReuse() {
        super.prepareForReuse()
        self.subviews.forEach { (item) in
            if item.tag == 1 {
                item.removeFromSuperview()
            }
        }
    }

    // MARK: - Private functions
    private func configUI(sunrise: String, sunset: String) {
        guard !sunrise.isEmpty && !sunset.isEmpty else { return }
        let frameCircle = CGRect(x: 40, y: 30, width: 300, height: 300)
        let circleCustom = SunandWindView(frame: frameCircle)
        circleCustom.createADC()
        circleCustom.createLine(hoursCurrent: getHoursCurrent(), minuteCurrent: getMinutesCurrent(), sunrise: sunrise, sunset: sunset)
        circleCustom.configSunsetSunrise(sunRise: sunrise, sunSet: sunset)
        circleCustom.tag = 1
        addSubview(circleCustom)
    }

    func getHoursCurrent() -> Int {
        let date = Date()
        let calendar = Calendar.current
        return calendar.component(.hour, from: date)
    }

    func getMinutesCurrent() -> Int {
        let date = Date()
        let calendar = Calendar.current
        return calendar.component(.minute, from: date)
    }
}
