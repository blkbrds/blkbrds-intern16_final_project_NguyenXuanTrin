//
//  EveryHoursCellViewModel.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/28/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class EveryHoursTableViewCellViewModel {

    // MARK: - Properties
    private(set) var listData: [ForecastsEveryHours]
    var condition: ConditionToday

    init(listData: [ForecastsEveryHours], condition: ConditionToday) {
        self.listData = listData
        self.condition = condition
    }

    // MARK: - Functions
    func numberOfSections() -> Int {
        return 1
    }

    func numberOfItemsInSection() -> Int {
        return 48
    }

    func viewModelForItem(at indexPath: IndexPath) -> EveryHoursCollectionViewViewModel? {
        guard 0 <= indexPath.row && indexPath.row < listData.count else { return nil }
        let everyHours = listData[indexPath.row]
        return EveryHoursCollectionViewViewModel(everyHours: everyHours, condition: condition, numbers: indexPath.row)
    }

    func viewModelForCell(at indexPath: IndexPath) -> ForecastsEveryHours? {
        guard 0 <= indexPath.row && indexPath.row < listData.count else { return nil }
        let everyHours = listData[indexPath.row]
        return everyHours
    }
    
    func findMax() -> Int {
        var array: [Int] = []
        var temp: ForecastsEveryHours
        for i in 0..<48 {
            temp = listData[i]
            array.append(temp.temperatureToday)
        }
        var max = array[0]
        for i in array {
            if i > max {
                max = i
            }
        }
        return max
    }
}
