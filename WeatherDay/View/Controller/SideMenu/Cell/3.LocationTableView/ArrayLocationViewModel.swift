//
//  ArrayLocationViewModel.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/8/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import RealmSwift
import Foundation

final class ArrayLoactionViewModel {

    init() {
        self.fetchKeyLocation()
    }

    // MARK: - Properties
    var keySearch: KeySearch = KeySearch()

    // MARK: - Functions
    func numberOfRowsInSectionLocationArrayTableview() -> Int {
        return keySearch.reversedList.count
    }

    func viewModelForItemLocationTableView(indexPath: IndexPath) -> CellforArrayViewModel? {
        return CellforArrayViewModel(locationName: keySearch.reversedList[indexPath.row])
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

    func fetchKeyLocation() {
        do {
            let realm = try Realm()
            if let result = realm.objects(KeySearch.self).first {
                keySearch = result
            }
        } catch {
            print(error.localizedDescription)
        }
    }

    func removeKeyLocation(locationName: String) {
        do {
            let realm = try Realm()
            try realm.write {
                if let index = keySearch.keyList.index(of: locationName) {
                    keySearch.keyList.remove(at: index)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
