//
//  WeatherDailyTableCellViewModel.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/29/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class WeatherDailyTableCellViewModel {

    // MARK: - Properties
    private(set) var listWeatherDaily: [WeatherDaily]

    init(listWeatherDaily: [WeatherDaily]) {
        self.listWeatherDaily = listWeatherDaily
    }

    // MARK: - Functions
    func numberOfSections() -> Int {
        return 1
    }

    func numberOfRowInSection() -> Int {
        return 7
    }

    func viewModelForRows(at indexPath: IndexPath) -> DailyTableCellViewModel? {
        let temp = listWeatherDaily[indexPath.row]
        return DailyTableCellViewModel(weatherDaily: temp)
    }
}
