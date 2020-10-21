//
//  AmountofRainTableViewModel.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/2/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class AmountofRainTableViewModel {
    
    // MARK: - Properties
    private(set) var listAmountOfRain: [AmountofRain]
    private(set) var listDataForecasts: [ForecastsEveryHours]
    var array: [ForecastsEveryHours] = []
    
    init(listAmountOfRain: [AmountofRain],listDataForecasts: [ForecastsEveryHours]) {
        self.listAmountOfRain = listAmountOfRain
        self.listDataForecasts = listDataForecasts
    }
    
    // MARK: - Functions
    
    func numberOfItemsInSection() -> Int {
        return listAmountOfRain.count
    }
    
    func viewModelForItem(at indexPath: IndexPath) -> AmountofRainCollectionViewModel? {
        guard 0 <= indexPath.row && indexPath.row < array.count else { return nil }
        let amountofRain = listAmountOfRain[indexPath.row]
        let forecasts = array[indexPath.row]
        return AmountofRainCollectionViewModel(amountOfRain: amountofRain, forecastsEveryHours: forecasts)
    }
    
    func findItemforCell() {
        var temp: ForecastsEveryHours
        for i in 1..<24 {
            if i % 5 == 0 {
                temp = listDataForecasts[i]
                array.append(temp)
            }
        }
    }
}
