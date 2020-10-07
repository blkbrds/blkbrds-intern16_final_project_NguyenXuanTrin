//
//  HomeViewModel.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/25/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class HomeViewModel {

    // MARK: - Properties
    var forecasts: Forecasts = Forecasts()
    var current: CurrentObservation = CurrentObservation()

    // MARK: - Functions
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsInSection() -> Int {
        return 1
    }
    
    func viewModelForCellOne() -> WeatherTodayViewModel {
        let viewModel = WeatherTodayViewModel(weatherStatus: current.weatherStatus, temperatureMin: forecasts.temperatureMin, temperatureMax: forecasts.temperatureMax, temperatureToday: current.temperatureToday)
        return viewModel
    }
}
