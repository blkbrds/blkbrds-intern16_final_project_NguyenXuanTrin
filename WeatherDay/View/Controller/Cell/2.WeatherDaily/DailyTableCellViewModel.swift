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

    var dayOfWeek: String {
        return forecasts.dayOfWeek
    }
    var percentHumidity: Int {
        return 35
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
    
    func infoHumidityDaily(humidity: Int) -> String {
        return "\(humidity.string)%"
    }
}
