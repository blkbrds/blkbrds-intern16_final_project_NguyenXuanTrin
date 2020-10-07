//
//  WeatherTodayViewModel.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/25/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class WeatherTodayViewModel {

    // MARK: - Properties
    var weatherStatus: String
    var temperatureMin: Int
    var temperatureMax: Int
    var temperatureToday: Int

    // MARK: - Initialaze
    init(weatherStatus: String, temperatureMin: Int, temperatureMax: Int, temperatureToday: Int) {
        self.weatherStatus = "Mưa to"
        self.temperatureMin = 30
        self.temperatureMax = 35
        self.temperatureToday = 32
    }
    
    func infoWeatherToday(temperature: Int) -> String {
        return "\(temperature.string)º"
    }
}
