//
//  Forecasts.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/25/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import ObjectMapper
import Foundation

final class Forecasts: Mappable {

    // MARK: Properties
    var temperatureMin: Int = 0
    var temperatureMax: Int = 0

    // MARK: - Initialaze
    init?(map: Map) {
    }
    
    init() {
    }

    // MARK: - Functions
    func mapping(map: Map) {
        temperatureMin <- map["low"]
        temperatureMax <- map["high"]
    }
}
