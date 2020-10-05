//
//  AmountofRainCollectionViewModel.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/2/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class AmountofRainCollectionViewModel {
    
    // MARK: - Properties
    var amountOfRain: AmountofRain

    var statusRain: String {
        return amountOfRain.statusOfRain
    }
    var humidity: Int {
        return amountOfRain.humidity
    }
    init(amountOfRain: AmountofRain) {
        self.amountOfRain = amountOfRain
    }
}
