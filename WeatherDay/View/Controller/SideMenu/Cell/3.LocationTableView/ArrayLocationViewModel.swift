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
