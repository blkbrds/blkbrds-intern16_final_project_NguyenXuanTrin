//
//  SunandWindTableViewModel.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/1/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class SunandWindTableViewModel {
    
    // MARK: - Properties
    var astronomy: Astronomy
    var checkPoint: Bool
    
    var sunrise: String {
        return astronomy.sunrise
    }
    
    var sunset: String {
        return astronomy.sunset
    }
    // MARK: - Initalize
    init(astronomy: Astronomy, checkPoint: Bool) {
        self.astronomy = astronomy
        self.checkPoint = checkPoint
    }
}
