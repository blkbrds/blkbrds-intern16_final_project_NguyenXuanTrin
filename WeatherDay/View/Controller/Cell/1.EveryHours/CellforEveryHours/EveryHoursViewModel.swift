//
//  EveryHoursViewModel.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/28/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import MVVM

final class EveryHoursCollectionViewViewModel: ViewModel {

    // MARK: - Properties
    var everyHours: EveryHours
    var condition: ConditionToday
    
    var url: String {
        return "https://s.yimg.com/zz/combo?a/i/us/nws/weather/gr/" + String(code) + "ds.png"
    }
    
    var code: Int {
        return condition.code
    }

    var percentOfRain: Int {
        return everyHours.percentOfRain
    }
    var weatherShowEveryHours: String {
        return everyHours.weatherShowEveryHours
    }
    var temperature: Int {
        return everyHours.temperature
    }
    var timeEveryHours: String {
        return everyHours.timeEveryHours
    }
    init(everyHours: EveryHours, condition: ConditionToday) {
        self.everyHours = everyHours
        self.condition = condition
    }
}
