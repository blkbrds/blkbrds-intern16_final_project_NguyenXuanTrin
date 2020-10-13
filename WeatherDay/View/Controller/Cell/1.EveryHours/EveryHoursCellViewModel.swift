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
    private(set) var listData: [EveryHours]
    var condition: ConditionToday

    init(listData: [EveryHours], condition: ConditionToday) {
        self.listData = listData
        self.condition = condition
    }

    // MARK: - Functions
    func numberOfSections() -> Int {
        return 1
    }

    func numberOfItemsInSection() -> Int {
        return 12
    }

    func viewModelForItem(at indexPath: IndexPath) -> EveryHoursCollectionViewViewModel? {
        let everyHours = listData[indexPath.row]
        return EveryHoursCollectionViewViewModel(everyHours: everyHours, condition: condition)
    }

    func viewModelForCell(at indexPath: IndexPath) -> EveryHours {
        let everyHours = listData[indexPath.row]
        return everyHours
    }
}
