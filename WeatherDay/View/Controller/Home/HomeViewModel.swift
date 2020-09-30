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

        var numberOfRowInSections: Int {
            switch self {
            case .weatherToday: return 2
            case .weatherDayofWeek: return 2
            case .weatherDetails: return 1
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
    var current: CurrentObservation = CurrentObservation()
    var listEveryHours: [EveryHours] = []
    var listWeatherDailys: [WeatherDaily] = []

    // MARK: - Functions
    func numberOfSections() -> Int {
        return 2
    }

    func numberOfRowsInSection(inSection section: Int) -> Int {
        guard let sectionType = HomeSectionType(rawValue: section) else { return 0 }
        switch sectionType {
        case .weatherToday:
            return 2
        case .weatherDayofWeek:
            return 8
        case .weatherDetails:
            return 2
        }
    }

    func viewModelForCellOne() -> WeatherTodayViewModel {
        let viewModel = WeatherTodayViewModel(weatherStatus: current.weatherStatus, temperatureMin: forecasts.temperatureMin, temperatureMax: forecasts.temperatureMax, temperatureToday: current.temperatureToday)
        return viewModel
    }

    func viewModelForCellTwo() -> EveryHoursTableViewCellViewModel? {
        getListEveryHours()
        let everyHours = listEveryHours
        return EveryHoursTableViewCellViewModel(listData: everyHours)
    }

    func viewModelForCellFour(at indexPath: IndexPath) -> DailyTableCellViewModel? {
        getListWeatherDaily()
        let temp = listWeatherDailys[indexPath.row - 1]
        return DailyTableCellViewModel(weatherDaily: temp)
    }

    private func getListEveryHours() {
        listEveryHours = DataforCell.listEveryHours()
    }

    private func getListWeatherDaily() {
        listWeatherDailys = DataforCell.listWeatherDaily()
    }
}
