//
//  SearchViewModel.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/6/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class SearchViewModel {
    
    // MARK: - Properties
    var listProvince: [Province] = []
    var filter: [Province] = []
    
    func numberOfRowsInSection() -> Int{
        return filter.count
    }
    
    func viewModelForItem(at indexPath: IndexPath) -> SearchCellViewModel? {
        let province = filter[indexPath.row]
        return SearchCellViewModel(province: province)
    }
    
    func getListProvince() {
        listProvince = DataforCell.provinceList()
    }
}
