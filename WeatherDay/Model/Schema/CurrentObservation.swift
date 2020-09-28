//
//  CurrentObservation.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/25/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import ObjectMapper
import Foundation

final class CurrentObservation: Mappable {

    // MARK: Properties
    var weatherStatus: String = "Trin"
    var temperatureToday: Int = 0

    // MARK: - Initialaze
    init?(map: Map) {
    }

    init() {
    }

    // MARK: - Functions
    func mapping(map: Map) {
        weatherStatus <- map["condition.text"]
        temperatureToday <- map["condition.temperature"]
    }
}
