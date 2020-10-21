//
//  CurrentObservation.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/25/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import ObjectMapper
import Foundation

final class ConditionToday: Mappable {

    // MARK: Properties
    var code: Int = 0
    var weatherStatus: String = ""
    var temperatureToday: Int = 0

    // MARK: - Initialaze
    init?(map: Map) {
    }

    init() {
    }

    // MARK: - Functions
    func mapping(map: Map) {
        code <- map["code"]
        weatherStatus <- map["text"]
        temperatureToday <- map["temperature"]
    }
}
