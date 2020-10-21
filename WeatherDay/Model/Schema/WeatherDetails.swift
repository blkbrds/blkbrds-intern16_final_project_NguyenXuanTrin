//
//  WeatherDetails.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/30/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class WeatherDetails {

    // MARK: - Properties
    var temperature: Int = 0
    var humidity: Int = 0
    var visibility: Int = 0
    var uvIndex: String = ""
    var dewpoint: Int = 0

    // MARK: - Initialize
    init(temperature: Int, humidity: Int, visibility: Int, uvIndex: String, dewpoint: Int) {
        self.temperature = temperature
        self.humidity = humidity
        self.visibility = visibility
        self.uvIndex = uvIndex
        self.dewpoint = dewpoint
    }
}
