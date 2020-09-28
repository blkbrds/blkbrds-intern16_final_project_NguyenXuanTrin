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
//    func loadAPI1(completion: @escaping DataCompletion<Forecasts>) {
//        APIManager.Forecasts.getForecastsByCity() { result in
//            switch result {
//            case .failure(let eror):
//                completion(.failure(APIError.error("eror")))
//            case .success:
//                completion(.success(forecastsResult))
//            }
//        }
//    }

//    func loadAPI2(completion: @escaping APICompletion<CurrentObservation>) {
//        APIManager.CurrentObservation.getCurrentByCity() { result in
//            switch result {
//            case .failure(let eror):
//                completion(.failure(APIError.error("eror")))
//            case .success(let currentResult):
//                completion(.success(currentResult))
//            }
//        }
//    }
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
