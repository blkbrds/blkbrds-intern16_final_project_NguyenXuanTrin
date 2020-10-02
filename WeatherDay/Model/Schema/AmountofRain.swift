//
//  AmountofRain.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/2/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class AmountofRain {

    // MARK: - Properties
    var statusOfRain: String = ""
    var humidity: Int = 0

    // MARK: - Initialize
    init(statusOfRain: String, humidity: Int) {
        self.statusOfRain = statusOfRain
        self.humidity = humidity
    }
}
