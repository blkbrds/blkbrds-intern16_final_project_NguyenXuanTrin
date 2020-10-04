//
//  MapTableViewModel.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/4/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class MapTableViewModel {
    var location: Location
    
    var lat: Double {
        return location.lat
    }
    
    var lon: Double {
        return location.lon
    }
    
    init(location: Location) {
        self.location = location
    }
}
