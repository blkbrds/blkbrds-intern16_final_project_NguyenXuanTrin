//
//  SideMenuViewModel.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/8/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import RealmSwift
import Foundation

final class SideMenuViewModel {

    var keySearch: KeySearch = KeySearch()

    enum SideMenuSectionType: Int {
        case location
    }

    enum location: Int {
        case row0
        case row1
    }

    func numberOfSections() -> Int {
        return 3
    }

    func numberOfRowsInSection(inSection section: Int) -> Int {
        guard let sectionType = SideMenuSectionType(rawValue: section) else { return 0 }
        switch sectionType {
        case .location:
            return numberOfRowsInSectionLocationTableview() + 1
        }
    }

    func numberOfRowsInSectionLocationTableview() -> Int {
        return keySearch.reversedList.count
    }

    func viewModelForItemLocationTableView(indexPath: IndexPath) -> LocationsViewModel? {
        guard 0 <= indexPath.row - 1 && indexPath.row - 1 < keySearch.reversedList.count else { return nil }
        return LocationsViewModel(historyKey: keySearch.reversedList[indexPath.row - 1])
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

    func fetchKeyLocation(completion: @escaping APICompletion) {
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
}
