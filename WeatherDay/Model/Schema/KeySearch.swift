//
//  KeySearch.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/7/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import RealmSwift
import Foundation

@objcMembers class KeySearch: Object {
    
    // MARK: Properties
    var id: Int = 0
    let keyList = List<String>()
    var reversedList: [String] {
        keyList.reversed()
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
