//
//  Location.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/4/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation
import ObjectMapper

final class Location: Mappable {

    // MARK: Properties
    var city: String = ""
    var country: String = ""
    var lat: Double = 0.0
    var lon: Double = 0.0

    // MARK: - Initialaze
    init?(map: Map) {
    }

    init() {
    }

    // MARK: - Functions
    func mapping(map: Map) {
        city <- map["city"]
        country <- map["country"]
        lat <- map["lat"]
        lon <- map["long"]
    }
}
