//
//  HomeViewModel.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/25/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class HomeViewModel {

    enum HomeSectionType: Int {
        case weatherToday
        case weatherDayofWeek
        case weatherDetails
        case map
        case sunAndWind
        case amountOfRain

        var numberOfRowInSections: Int {
            switch self {
            case .weatherToday: return 2
            case .weatherDayofWeek: return 2
            case .weatherDetails: return 1
            case .map: return 1
            case .sunAndWind: return 1
            case .amountOfRain: return 1
            }
        }

        static var count: Int {
            return HomeSectionType.weatherToday.hashValue + 1
        }
    }

    enum WeatherToday: Int {
        case row0
        case row1
    }

    enum WeatherDailys: Int {
        case row0
        case row1
    }

    // MARK: - Properties
    var forecasts: Forecasts = Forecasts()
    var forecastsArray: [Forecasts] = []
    var current: ConditionToday = ConditionToday()
    var atmosphere: Atmosphere = Atmosphere()
    var location: Location = Location()
    var astronomy: Astronomy = Astronomy()
    var listEveryHours: [EveryHours] = []
    var listAmountOfRain: [AmountofRain] = []

    // MARK: - Functions
    func numberOfSections() -> Int {
        return 6
    }

    func numberOfRowsInSection(inSection section: Int) -> Int {
        guard let sectionType = HomeSectionType(rawValue: section) else { return 0 }
        switch sectionType {
        case .weatherToday:
            return 2
        case .weatherDayofWeek:
            return 8
        case .weatherDetails:
            return 1
        case .map:
            return 1
        case .sunAndWind:
            return 1
        case .amountOfRain:
            return 1
        }
    }

    func viewModelForCellOne() -> WeatherTodayViewModel? {
        return WeatherTodayViewModel(forecasts: forecasts, condition: current)
    }

    func viewModelForCellTwo() -> EveryHoursTableViewCellViewModel? {
        getListEveryHours()
        let everyHours = listEveryHours
        return EveryHoursTableViewCellViewModel(listData: everyHours)
    }

    func viewModelForCellFour(at indexPath: IndexPath) -> DailyTableCellViewModel? {
        guard 0 <= indexPath.row - 1 && indexPath.row - 1 < forecastsArray.count else { return nil }
        let temp = forecastsArray[indexPath.row - 1]
        return DailyTableCellViewModel(forecasts: temp)
    }

    func viewModelForCellFive() -> DetailsOfDayViewModel? {
        return DetailsOfDayViewModel(condition: current, atmosphere: atmosphere)
    }

    func viewModelForCellSix() -> MapTableViewModel? {
        return MapTableViewModel(location: location)
    }

    func viewModelForCellSeven() -> SunandWindTableViewModel? {
        return SunandWindTableViewModel(astronomy: astronomy)
    }

    func viewModelForCellEight() -> AmountofRainTableViewModel? {
        getListAmountOfRain()
        let temps = listAmountOfRain
        return AmountofRainTableViewModel(listData: temps)
    }

    private func getListEveryHours() {
        listEveryHours = DataforCell.listEveryHours()
    }

    private func getListAmountOfRain() {
        listAmountOfRain = DataforCell.listAmountofRain()
    }

    // MARK: API
    func loadForecasts(location: String, completion: @escaping APICompletion) {
        APIManager.Forecasts.getForecastsByCity(location: location) { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let forecastsResult):
                this.forecasts = forecastsResult
                completion(.success)
            }
        }
    }

    func loadForecastsArray(location: String, completion: @escaping APICompletion) {
        APIManager.Forecasts.getForecastsArrayByCity(location: location) { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let forecastsResult):
                this.forecastsArray = forecastsResult
                completion(.success)
            }
        }
    }

    func loadCondition(location: String, completion: @escaping APICompletion) {
        APIManager.Condition.getCurrentByCity(location: location) { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let currentResult):
                this.current = currentResult
                completion(.success)
            }
        }
    }

    func loadAtmosphere(location: String, completion: @escaping APICompletion) {
        APIManager.Atmosphere.getAtmosthereByCity(location: location) { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let atmosphereResult):
                this.atmosphere = atmosphereResult
                completion(.success)
            }
        }
    }

    func loadLocation(location: String, completion: @escaping APICompletion) {
        APIManager.Location.getLocationByCity(location: location) { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let locationResult):
                this.location = locationResult
                completion(.success)
            }
        }
    }

    func loadAstronomy(location: String, completion: @escaping APICompletion) {
        APIManager.Astronomy.getAstronomyByCity(location: location) { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let astronomyResult):
                this.astronomy = astronomyResult
                completion(.success)
            }
        }
    }
}
