//
//  ForecastsEveryHours.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/13/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import ObjectMapper
import Foundation

final class ForecastsEveryHours: Mappable {

    // MARK: Properties
    var temperatureToday: Int = 0
    var humidity: Int = 0

    // MARK: - Initialaze
    init?(map: Map) {
    }

    init() {
    }

    // MARK: - Functions
    func mapping(map: Map) {
        temperatureToday <- map["temp"]
        humidity <- map["humidity"]
    }
}
