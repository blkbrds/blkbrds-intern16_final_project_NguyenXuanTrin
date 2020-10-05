//
//  Atmosphere.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/4/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import ObjectMapper
import Foundation

final class Atmosphere: Mappable {

    // MARK: Properties
    var humidity: Int = 0
    var visibility: Float = 0.0

    // MARK: - Initialaze
    init?(map: Map) {
    }

    init() {
    }

    // MARK: - Functions
    func mapping(map: Map) {
        humidity <- map["humidity"]
        visibility <- map["visibility"]
    }
}
