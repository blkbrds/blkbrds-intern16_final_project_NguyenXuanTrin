//
//  DetailsOfDayViewModel.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/28/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class DetailsOfDayViewModel {
    
    // MARK: - Properties
    var condition: ConditionToday
    var atmosphere: Atmosphere
    
    var temperature: Int {
        return condition.temperatureToday
    }
    var humidity: Int {
        return atmosphere.humidity
    }
    var visibility: Float {
        return atmosphere.visibility
    }
    var uvIndex: String {
        return "Low 0"
    }
    var dewpoint: Int {
        return 24
    }
    
    // MARK: - Initialize
    init(condition: ConditionToday, atmosphere: Atmosphere) {
        self.condition = condition
        self.atmosphere = atmosphere
    }
    
    // MARK: - Functions
    func infoTempDaily(temperature: Int) -> String {
        return "\(temperature.string)º"
    }
    
    func infoHumidityDaily(humidity: Int) -> String {
        return "\(humidity.string)%"
    }
    
    func infoVisibilityDaily(visibility: Float) -> String {
        return "\(humidity.string) km"
    }
}
