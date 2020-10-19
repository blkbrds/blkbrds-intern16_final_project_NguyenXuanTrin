//
//  SearchProvince.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/12/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation
import ObjectMapper

final class SearchProvince: Mappable {
    
    // MARK: Properties
    var name: String = ""

    // MARK: - Initialaze
    init?(map: Map) {
    }

    init() {
    }

    // MARK: - Functions
    func mapping(map: Map) {
        name <- map["name"]
        //name <- map["Title"]
    }
}
