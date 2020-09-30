//
//  APIManager.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/28/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation
import Alamofire

typealias JSObject = [String: Any]
typealias JSArray = [JSObject]

typealias Completion<Value> = (Result<Any>) -> Void
typealias APICompletion = (APIResult) -> Void
typealias DataCompletion<Value> = (Result<Value>) -> Void

enum APIResult {
    case success
    case failure(String)
}

let api = ApiManager()

final class ApiManager {

    var defaultHTTPHeaders: [String: String] {
        let headers: [String: String] = [:]
        return headers
    }
}

struct APIManager {
    // MARK: - Config
    struct Path {
        static let baseDomain = "https://weather-ydn-yql.media.yahoo.com"
        static let basePath = "/forecastrss"
    }

    // MARK: - Domain
    struct Forecasts { }
    struct CurrentObservation { }
}
