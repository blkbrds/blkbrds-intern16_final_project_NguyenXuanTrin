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
    var everyHours: ForecastsEveryHours
    var condition: ConditionToday
    var numbers: Int
    
    var url: String {
        return "https://s.yimg.com/zz/combo?a/i/us/nws/weather/gr/" + String(code) + "ds.png"
    }
    
    var code: Int {
        return condition.code
    }

    var percentOfRain: Int {
        return everyHours.humidity
    }
    
    var temperature: Int {
        return everyHours.temperatureToday
    }
    
    init(everyHours: ForecastsEveryHours, condition: ConditionToday, numbers: Int) {
        self.everyHours = everyHours
        self.condition = condition
        if numbers <= 23 {
            self.numbers = numbers
        } else {
            self.numbers = numbers - 24
        }
        
    }
}
