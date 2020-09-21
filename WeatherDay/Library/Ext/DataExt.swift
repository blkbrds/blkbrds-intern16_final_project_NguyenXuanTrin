//
//  DataExt.swift
//  FinalProject
//
//  Created by Thinh Nguyen X. on 9/10/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation
extension Data {
    
    public func toJSON() -> Any? {
        do {
            return try JSONSerialization.jsonObject(with: self, options: JSONSerialization.ReadingOptions.allowFragments)
        } catch {
            return nil
        }
    }

    public func toString(_ encoding: String.Encoding = String.Encoding.utf8) -> String? {
        return String(data: self, encoding: encoding)
    }
}
