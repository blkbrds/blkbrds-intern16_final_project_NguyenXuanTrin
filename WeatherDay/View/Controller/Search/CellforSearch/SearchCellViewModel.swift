//
//  SearchCellViewModel.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/5/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class SearchCellViewModel {
    
    // MARK: - Properties
    var province: Province
    
    var provinceName: String {
        return province.provinceName
    }
    
    // MARK: - Initialize
    init(province :Province) {
        self.province = province
    }
}
