//
//  Province.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/5/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import RealmSwift
import Foundation

@objcMembers class Province: Object {
    
    // MARK: Properties
    var provinceName = ""
    let provinceList = List<String>()
    
    // MARK: Initialize
    init(province: String) {
        self.provinceName = province
    }
    
    required init() { }
}
