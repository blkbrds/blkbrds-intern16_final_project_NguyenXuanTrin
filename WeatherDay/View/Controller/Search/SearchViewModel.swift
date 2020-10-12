//
//  SearchViewModel.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/6/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation
import RealmSwift

final class SearchViewModel {

    // MARK: - Properties
    var filterList: [Province] = []
    var keySearch: KeySearch = KeySearch()

    init() {
        fetchKeySearch()
    }

    func numberOfRowsInSectionResultTableview() -> Int {
        return filterList.count
    }

    func numberOfRowsInSectionHistoryTableview() -> Int {
        return keySearch.reversedList.count
    }

    func viewModelForItemResultTableView(at indexPath: IndexPath) -> SearchCellViewModel? {
        let province = filterList[indexPath.row]
        return SearchCellViewModel(province: province)
    }

    func viewModelForItemHistoryTableView(indexPath: IndexPath) -> HistoryCellViewModel? {
        return HistoryCellViewModel(historyKey: keySearch.reversedList[indexPath.row])
    }

    func getListProvince() {
        filterList = DataforCell.provinceList()
    }

    func saveProvinceToRealm(searchKey: String, completion: @escaping APICompletion) {
        do {
            let realm = try Realm()
            try realm.write {
                let count = keySearch.keyList.count
                if count == 0 {
                    keySearch.keyList.append(searchKey)
                    realm.add(keySearch)
                } else if count == 5 {
                    keySearch.keyList.removeFirst()
                    keySearch.keyList.append(searchKey)
                    realm.add(keySearch, update: .modified)
                }
                else {
                    if let index = keySearch.keyList.firstIndex(of: searchKey) {
                        keySearch.keyList.remove(at: index)
                    }
                    keySearch.keyList.append(searchKey)
                    realm.add(keySearch, update: .modified)
                }
            }
            completion(.success)
        } catch {
            completion(.failure(error))
        }
    }

    func fetchKeySearch() {
        do {
            let realm = try Realm()
            if let result = realm.objects(KeySearch.self).first {
                keySearch = result
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
