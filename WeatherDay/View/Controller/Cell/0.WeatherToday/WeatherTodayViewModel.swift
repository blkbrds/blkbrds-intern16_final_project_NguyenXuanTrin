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
    var forecasts: Forecasts
    var condition: ConditionToday
    
    var url: String {
        return "https://s.yimg.com/zz/combo?a/i/us/nws/weather/gr/" + String(code) + "ds.png"
    }
    
    var code: Int {
        return condition.code
    }
    var weatherStatus: String {
        return condition.weatherStatus
    }
    var temperatureMin: Int {
        return forecasts.temperatureMin
    }
    var temperatureMax: Int {
        return forecasts.temperatureMax
    }
    var temperatureToday: Int {
        return condition.temperatureToday
    }

    // MARK: - Initialaze
    init(forecasts: Forecasts, condition: ConditionToday) {
        self.forecasts = forecasts
        self.condition = condition
    }

    func infoWeatherToday(temperature: Int) -> String {
        return "\(temperature.string)º"
    }
}
