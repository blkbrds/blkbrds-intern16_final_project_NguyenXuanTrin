//
//  Api.swift
//  MyApp
//
//  Created by iOSTeam on 2/21/18.
//  Copyright © 2018 Asian Tech Co., Ltd. All rights reserved.
//

import Foundation

final class Api {
    struct Path {
        #if DEBUG
            static let baseURL = "https://dev-asiantech.vn"
        #elseif STG
            static let baseURL = "https://stg-asiantech.vn"
        #else
            static let baseURL = "https://pro-asiantech.vn"
        #endif
            static let base_domain = " https://thongtindoanhnghiep.co"
            static let base_path = "/api"
            static let city_list = "/city"
            static let base_domain_forecasts = "https://api.openweathermap.org/data/2.5/onecall?lat="
            static let base_lon = "&lon="
            static let base_hourly = "&exclude=current&units=metric&appid=49a74f4775a2a1c9165de02d81317fff"
    }
}

struct API {
    //singleton
    private static var shareAPI: API = {
        let shareAPI = API()
        return shareAPI
    }()

    static func shared() -> API {
        return shareAPI
    }

    //init
    private init() { }
}

protocol URLStringConvertible {
    var urlString: String { get }
}

protocol ApiPath: URLStringConvertible {
    static var path: String { get }
}

extension URL: URLStringConvertible {
    var urlString: String { return absoluteString }
}

extension Int: URLStringConvertible {
    var urlString: String { return String(describing: self) }
}

private func / (lhs: URLStringConvertible, rhs: URLStringConvertible) -> String {
    return lhs.urlString + "/" + rhs.urlString
}

extension String: URLStringConvertible {
    var urlString: String { return self }
}

extension CustomStringConvertible where Self: URLStringConvertible {
    var urlString: String { return description }
}
