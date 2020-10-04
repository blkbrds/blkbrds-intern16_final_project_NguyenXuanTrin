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
    var weatherDayOfDetails: WeatherDetails = WeatherDetails(temperature: 0, humidity: 0, visibility: 0, uvIndex: "", dewpoint: 0)
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
            return 10
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
        let temp = forecastsArray[indexPath.row - 1]
        return DailyTableCellViewModel(forecasts: temp)
    }

    func viewModelForCellFive() -> DetailsOfDayViewModel? {
        return DetailsOfDayViewModel(condition: current, atmosphere: atmosphere)
    }

    func viewModelForCellEight() -> AmountofRainTableViewModel? {
        getListAmountOfRain()
        let temps = listAmountOfRain
        return AmountofRainTableViewModel(listData: temps)
    }

    func postCheckPoint() -> SunandWindTableViewModel? {
        let temp: Bool = true
        return SunandWindTableViewModel(astronomy: astronomy, checkPoint: temp)
    }

    private func getListEveryHours() {
        listEveryHours = DataforCell.listEveryHours()
    }

    private func getListAmountOfRain() {
        listAmountOfRain = DataforCell.listAmountofRain()
    }

    // MARK: API

    func loadForecasts(completion: @escaping APICompletion) {
        APIManager.Forecasts.getForecastsByCity() { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .failure(let error):
                completion( .failure(error))
            case .success(let forecastsResult):
                this.forecasts = forecastsResult
                completion( .success)
            }
        }
    }
    
    func loadForecastsArray(completion: @escaping APICompletion) {
        APIManager.Forecasts.getForecastsArrayByCity() { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .failure(let error):
                completion( .failure(error))
            case .success(let forecastsResult):
                this.forecastsArray = forecastsResult
                completion( .success)
            }
        }
    }

    func loadCondition(completion: @escaping APICompletion) {
        APIManager.Condition.getCurrentByCity() { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .failure(let error):
                completion( .failure(error))
            case .success(let currentResult):
                this.current = currentResult
                completion( .success)
            }
        }
    }

    func loadAtmosphere(completion: @escaping APICompletion) {
        APIManager.Atmosphere.getAtmosthereByCity() { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .failure(let error):
                completion( .failure(error))
            case .success(let atmosphereResult):
                this.atmosphere = atmosphereResult
                completion( .success)
            }
        }
    }
    
    func loadLocation(completion: @escaping APICompletion) {
        APIManager.Location.getLocationByCity() { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .failure(let error):
                completion( .failure(error))
            case .success(let locationResult):
                this.location = locationResult
                completion( .success)
            }
        }
    }
    
    func loadAstronomy(completion: @escaping APICompletion) {
        APIManager.Astronomy.getAstronomyByCity() { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .failure(let error):
                completion( .failure(error))
            case .success(let astronomyResult):
                this.astronomy = astronomyResult
                completion( .success)
            }
        }
    }
}
