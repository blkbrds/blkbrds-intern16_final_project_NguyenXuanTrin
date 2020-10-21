//
//  DailyTableCellViewModel.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/29/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation
import MVVM

final class DailyTableCellViewModel: ViewModel {

    // MARK: - Properties
    var forecasts: Forecasts
    var url: String {
        return "https://s.yimg.com/zz/combo?a/i/us/nws/weather/gr/" + String(code) + "ds.png"
    }
    
    var code: Int {
        return forecasts.code
    }

    var dayOfWeek: String {
        return forecasts.dayOfWeek
    }
    
    var temperatureMin: Int {
        return forecasts.temperatureMin
    }
    
    var temperatureMax: Int {
        return forecasts.temperatureMax
    }

    init(forecasts: Forecasts) {
        self.forecasts = forecasts
    }

    func infoTempDaily(temperature: Int) -> String {
        return "\(temperature.string)º"
    }

    func infoDayofWeek(day: String) -> String {
        switch forecasts.dayOfWeek {
        case "Tue":
            return "Tuesday"
        case "Wed":
            return "Wednesday"
        case "Thu":
            return "Thusday"
        case "Sat":
            return "Saturday"
        default:
            return forecasts.dayOfWeek + "day"
        }
    }
}
