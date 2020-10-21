//
//  HomeViewModel.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/25/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation
import RealmSwift

final class HomeViewModel {

    enum HomeSectionType: Int {
        case weatherToday
        case weatherDayofWeek
        case weatherDetails
        case map
        case sunAndWind
        case amountOfRain
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
    var forecastsEveryHoursList: [ForecastsEveryHours] = []
    var daily: DailyWeather = DailyWeather()
    var current: ConditionToday = ConditionToday()
    var atmosphere: Atmosphere = Atmosphere()
    var location: Location = Location()
    var astronomy: Astronomy = Astronomy()
    var listAmountOfRain: [AmountofRain] = []
    var keySearch: KeySearch = KeySearch()

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
        case .weatherDetails, .map, .sunAndWind, .amountOfRain:
            return 1
        }
    }

    func viewModelForCellOne() -> WeatherTodayViewModel? {
        return WeatherTodayViewModel(forecasts: forecasts, condition: current)
    }

    func viewModelForCellTwo() -> EveryHoursTableViewCellViewModel? {
        return EveryHoursTableViewCellViewModel(listData: forecastsEveryHoursList, condition: current)
    }

    func viewModelForCellFour(at indexPath: IndexPath) -> DailyTableCellViewModel? {
        guard 0 <= indexPath.row - 1 && indexPath.row - 1 < forecastsArray.count else { return nil }
        let temp = forecastsArray[indexPath.row - 1]
        return DailyTableCellViewModel(forecasts: temp)
    }

    func viewModelForCellFive() -> DetailsOfDayViewModel? {
        guard let forecastsEveryHours = forecastsEveryHoursList.first else { return nil }
            return DetailsOfDayViewModel(condition: current, daily: daily, hourly: forecastsEveryHours) }

    func viewModelForCellSix() -> MapTableViewModel? {
        return MapTableViewModel(location: location)
    }

    func viewModelForCellSeven() -> SunandWindTableViewModel? {
        return SunandWindTableViewModel(astronomy: astronomy)
    }

    func viewModelForCellEight() -> AmountofRainTableViewModel? {
        getListAmountOfRain()
        let temps = listAmountOfRain
        return AmountofRainTableViewModel(listAmountOfRain: temps, listDataForecasts: forecastsEveryHoursList)
    }

    private func getListAmountOfRain() {
        listAmountOfRain = DataforCell.listAmountofRain()
    }

    func fetchKeySearch(completion: @escaping APICompletion) {
        do {
            let realm = try Realm()
            if let result = realm.objects(KeySearch.self).first {
                keySearch = result
                completion(.success)
            }
        } catch {
            completion(.failure(error))
        }
    }

    func getFirstKey() -> String? {
        return keySearch.reversedList.first
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

    func loadDailyWeather(lat: Double, lon: Double, completion: @escaping APICompletion) {
        APIManager.DailyWeather.getDailyWeather(lat: lat, lon: lon) { [weak self] (result) in
            guard let this = self else { return }
            switch result {
            case .success(let dailyResult):
                this.daily = dailyResult
                completion(.success)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func loadForecastsEveryHours(lat: Double, lon: Double, completion: @escaping APICompletion) {
        APIManager.ForecastsEveryHours.getForecastsEveryHours(lat: lat, lon: lon) { [weak self] (result) in
            guard let this = self else { return }
            switch result {
            case .success(let everyHoursResult):
                this.forecastsEveryHoursList = everyHoursResult
                completion(.success)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
