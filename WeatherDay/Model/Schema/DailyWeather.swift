//
//  DailyWeather.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/16/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import ObjectMapper
import Foundation

final class DailyWeather: Mappable {

    // MARK: Properties
    var humidity: Int = 0
    var uvRays: Double = 0.0
    var dewPoint: Double = 0.0

    // MARK: - Initialaze
    init?(map: Map) {
    }

    init() {
    }

    // MARK: - Functions
    func mapping(map: Map) {
        humidity <- map["humidity"]
        uvRays <- map["uvi"]
        dewPoint <- map["dew_point"]
    }
}
