//
//  Astronomy.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/4/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation
import ObjectMapper

final class Astronomy: Mappable {

    // MARK: Properties
    var sunrise: String = ""
    var sunset: String = ""

    // MARK: - Initialaze
    init?(map: Map) {
    }

    init() {
    }

    // MARK: - Functions
    func mapping(map: Map) {
        sunrise <- map["sunrise"]
        sunset <- map["sunset"]
    }
}
