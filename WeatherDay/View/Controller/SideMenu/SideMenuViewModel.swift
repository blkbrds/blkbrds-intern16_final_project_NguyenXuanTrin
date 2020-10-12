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
        case profile
        case location
        case notification
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
        case .profile:
            return 1
        case .location:
            return numberOfRowsInSectionLocationTableview() + 1
        case .notification:
            return 1
        }
    }

    func numberOfRowsInSectionLocationTableview() -> Int {
        return keySearch.reversedList.count
    }

    func viewModelForItemLocationTableView(indexPath: IndexPath) -> LocationsViewModel? {
        guard 0 <= indexPath.row - 1 && indexPath.row - 1 < keySearch.reversedList.count else { return nil }
        return LocationsViewModel(historyKey: keySearch.reversedList[indexPath.row - 1])
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
}
