//
//  DailyTableCellViewModel.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/29/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class DailyTableCellViewModel {

    // MARK: - Properties
    var weatherDaily: WeatherDaily

    var dayOfWeek: String {
        return weatherDaily.dayOfWeek
    }
    var percentHumidity: Int {
        return weatherDaily.percentHumidity
    }
    var temperatureMin: Int {
        return weatherDaily.temperatureMin
    }
    var temperatureMax: Int {
        return weatherDaily.temperatureMax
    }

    init(weatherDaily: WeatherDaily) {
        self.weatherDaily = weatherDaily
    }
}
