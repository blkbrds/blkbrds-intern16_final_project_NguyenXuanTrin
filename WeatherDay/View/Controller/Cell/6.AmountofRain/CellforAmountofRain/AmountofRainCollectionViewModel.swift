//
//  AmountofRainCollectionViewModel.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/2/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class AmountofRainCollectionViewModel {
    
    // MARK: - Properties
    var amountOfRain: AmountofRain
    var forecastsEveryHours: ForecastsEveryHours

    var statusRain: String {
        return amountOfRain.statusOfRain
    }
    var humidity: Int {
        return forecastsEveryHours.humidity
    }
    
    // MARK: - Initialize
    init(amountOfRain: AmountofRain, forecastsEveryHours: ForecastsEveryHours) {
        self.amountOfRain = amountOfRain
        self.forecastsEveryHours = forecastsEveryHours
    }
}
