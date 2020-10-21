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
    var searchProvince: SearchProvince
    
    var name: String {
        return searchProvince.name
    }
    
    // MARK: - Initialize
    init(searchProvince :SearchProvince) {
        self.searchProvince = searchProvince
    }
}
