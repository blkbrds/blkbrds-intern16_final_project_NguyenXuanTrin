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
    init(everyHours: EveryHours) {
        self.everyHours = everyHours
    }
}
