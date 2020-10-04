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
    private(set) var listData: [AmountofRain]

    init(listData: [AmountofRain]) {
        self.listData = listData
    }

    // MARK: - Functions

    func numberOfItemsInSection() -> Int {
        return listData.count
    }

    func viewModelForItem(at indexPath: IndexPath) -> AmountofRainCollectionViewModel? {
        let amoutOfRain = listData[indexPath.row]
        return AmountofRainCollectionViewModel(amountOfRain: amoutOfRain)
    }
}
