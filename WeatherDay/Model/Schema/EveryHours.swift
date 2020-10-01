//
//  EveryHours.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/28/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class EveryHours {
    
    // MARK: - Properties
    var percentOfRain: Int = 0
    var weatherShowEveryHours: String = ""
    var temperature: Int = 0
    var timeEveryHours: String = ""
    
    // MARK: - Initialize
    init(percentOfRain: Int,weatherShowEveryHours: String,temperature: Int,timeEveryHours: String) {
        self.percentOfRain = percentOfRain
        self.weatherShowEveryHours = weatherShowEveryHours
        self.temperature = temperature
        self.timeEveryHours = timeEveryHours
    }
}
