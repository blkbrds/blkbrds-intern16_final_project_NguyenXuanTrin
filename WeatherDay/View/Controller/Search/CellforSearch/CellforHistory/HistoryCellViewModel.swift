//
//  HistoryCellViewModel.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/8/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class HistoryCellViewModel {
    
    // MARK: - Properties
    var keySearch: KeySearch
    
    var keyList: [String] {
        return keySearch.reversedList
    }
    
    init(keySearch: KeySearch) {
        self.keySearch = keySearch
    }
    
}