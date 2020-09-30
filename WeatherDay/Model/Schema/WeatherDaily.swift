//
//  WeatherDaily.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/29/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class WeatherDaily {

    // MARK: - Properties
    var dayOfWeek: String = ""
    var temperatureMin: Int = 0
    var temperatureMax: Int = 0

    // MARK: - Initialize
    init(dayOfWeek: String, temperatureMin: Int, temperatureMax: Int) {
        self.dayOfWeek = dayOfWeek
        self.temperatureMin = temperatureMin
        self.temperatureMax = temperatureMax
    }
}
