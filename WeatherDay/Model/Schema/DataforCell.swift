//
//  Data.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/28/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class DataforCell {

    static func listAmountofRain() -> [AmountofRain] {
        let listAmountofRain: [AmountofRain] = [
            AmountofRain(statusOfRain: "Morning", humidity: 10),
            AmountofRain(statusOfRain: "Noon", humidity: 25),
            AmountofRain(statusOfRain: "Afternoon", humidity: 40),
            AmountofRain(statusOfRain: "Evening", humidity: 80)
        ]
        return listAmountofRain
    }
}
