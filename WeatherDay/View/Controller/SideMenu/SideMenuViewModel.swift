//
//  SideMenuViewModel.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/8/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class SideMenuViewModel {
    
    enum SideMenuSectionType: Int {
        case profile
        case location
        case notification

        var numberOfRowInSections: Int {
            switch self {
            case .profile: return 1
            case .location: return 6
            case .notification: return 1
            }
        }
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
            return 6
        case .notification:
            return 1
        }
    }
}
