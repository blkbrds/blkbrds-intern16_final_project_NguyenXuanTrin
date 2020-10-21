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
    var filterList: [SearchProvince] = []
    var resultList: [SearchProvince] = []
    var keySearch: KeySearch = KeySearch()

    func numberOfRowsInSectionResultTableview() -> Int {
        return filterList.count
    }

    func numberOfRowsInSectionHistoryTableview() -> Int {
        return keySearch.reversedList.count
    }

    func viewModelForItemResultTableView(at indexPath: IndexPath) -> SearchCellViewModel? {
        guard 0 <= indexPath.row && indexPath.row < filterList.count else { return nil }
        let searchProvince = filterList[indexPath.row]
        return SearchCellViewModel(searchProvince: searchProvince)
    }

    func viewModelForItemHistoryTableView(indexPath: IndexPath) -> HistoryCellViewModel? {
        guard 0 <= indexPath.row && indexPath.row < filterList.count else { return nil }
        return HistoryCellViewModel(historyKey: keySearch.reversedList[indexPath.row])
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
                    if let index = keySearch.keyList.firstIndex(of: searchKey) {
                        keySearch.keyList.remove(at: index)
                    } else {
                        keySearch.keyList.removeFirst()
                    }
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

    func fetchKeySearch(completion: @escaping APICompletion) {
        do {
            let realm = try Realm()
            if let result = realm.objects(KeySearch.self).first {
                keySearch = result
                completion(.success)
            }
        } catch {
            completion(.failure(error))
        }
    }

    func getListNameCityInTheWorld(completion: @escaping APICompletion) {
        APIManager.Search.searchNameCityInTheWorld { [weak self] (result) in
            guard let this = self else { return }
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let nameResult):
                this.resultList = nameResult
                completion(.success)
            }
        }
    }
    
    func getListNameCityInVietNam(completion: @escaping APICompletion) {
        APIManager.Search.searchNameCityInVietNam { [weak self] (result) in
            guard let this = self else { return }
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let nameVNResult):
                this.resultList = nameVNResult
                completion(.success)
            }
        }
    }
}
