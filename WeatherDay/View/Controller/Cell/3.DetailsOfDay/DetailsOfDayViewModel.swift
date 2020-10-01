//
//  DetailsOfDayViewModel.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/28/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class DetailsOfDayViewModel {
    var weatherDetails: WeatherDetails
    
    var temperature: Int {
        return weatherDetails.temperature
    }
    var humidity: Int {
        return weatherDetails.humidity
    }
    var visibility: Int {
        return weatherDetails.visibility
    }
    var uvIndex: String {
        return weatherDetails.uvIndex
    }
    var dewpoint: Int {
        return weatherDetails.dewpoint
    }
    
    init(weatherDetails: WeatherDetails) {
        self.weatherDetails = weatherDetails
    }
}
