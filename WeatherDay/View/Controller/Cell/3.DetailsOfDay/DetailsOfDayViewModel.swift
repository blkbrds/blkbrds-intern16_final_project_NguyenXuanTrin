//
//  DetailsOfDayViewModel.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/28/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class DetailsOfDayViewModel {
    
    // MARK: - Properties
    var condition: ConditionToday
    var daily: DailyWeather
    var hourly: ForecastsEveryHours
    
    var url: String {
        return "https://s.yimg.com/zz/combo?a/i/us/nws/weather/gr/" + String(code) + "d.png"
    }
    
    var code: Int {
        return condition.code
    }
    
    var temperature: Int {
        return condition.temperatureToday
    }
    var humidity: Int {
        return daily.humidity
    }
    var visibility: Int {
        return hourly.visibility
    }
    var uvIndex: Double {
        return daily.uvRays
    }
    var dewpoint: Double {
        return daily.dewPoint
    }
    
    // MARK: - Initialize
    init(condition: ConditionToday, daily: DailyWeather, hourly: ForecastsEveryHours) {
        self.condition = condition
        self.daily = daily
        self.hourly = hourly
    }
    
    // MARK: - Functions
    func infoTempDaily(temperature: Int) -> String {
        return "\(temperature.string)º"
    }
    
    func infoHumidityDaily(humidity: Int) -> String {
        return "\(humidity.string) %"
    }
    
    func infoVisibilityDaily(visibility: Int) -> String {
        return "\(visibility.string) m"
    }
    
    func infoUVIndex(uvIndex: Double) -> String {
        return "\(daily.uvRays)"
    }
    
    func infoDewPoint(dewPoint: Double) -> String {
        return "\(daily.dewPoint)"
    }
}
