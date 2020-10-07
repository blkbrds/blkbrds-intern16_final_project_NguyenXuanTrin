//
//  ApiOAuth.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/25/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import OAuthSwift
import Foundation

enum YahooWeatherAPIResponseType: String {
    case json = "json"
    case xml = "xml"
}

enum YahooWeatherAPIUnitType: String {
    case imperial = "f"
    case metric = "c"
}

private struct YahooWeatherAPIClientCredentials {
    var appId = ""
    var clientId = ""
    var clientSecret = ""
}

final class ApiOAuth {

    // MARK: - Singleton
    private static var sharedApi: ApiOAuth = {
        let apiOAuth = ApiOAuth()
        return apiOAuth
    }()

    class func shared() -> ApiOAuth {
        return sharedApi
    }
    
    // MARK: - Properties
    private let credentials = YahooWeatherAPIClientCredentials(appId: Key.appId, clientId: Key.clientId, clientSecret: Key.clientSecret)
    private let url: String = APIManager.Path.baseDomain + APIManager.Path.basePath
    private let oauth: OAuth1Swift?
    private var headers: [String: String] {
        return [
            "X-Yahoo-App-Id": self.credentials.appId
        ]
    }

    // MARK: - Private funtions
    private init() {
        oauth = OAuth1Swift(consumerKey: self.credentials.clientId, consumerSecret: self.credentials.clientSecret)
    }

    /// Requests weather data by location name.
    ///
    /// - Parameters:
    ///   - location: the name of the location, i.e. sunnyvale,ca
    ///   - failure: failure callback
    ///   - success: success callback
    ///   - responseFormat: .xml or .json. default is .json.
    ///   - unit: metric or imperial units. default = .imperial
    func weather(location: String, failure: @escaping (_ error: OAuthSwiftError) -> Void, success: @escaping (_ response: OAuthSwiftResponse) -> Void, responseFormat: YahooWeatherAPIResponseType = .json, unit: YahooWeatherAPIUnitType = .metric) {
        self.makeRequest(parameters: ["location": location, "format": responseFormat.rawValue, "u": unit.rawValue], failure: failure, success: success)
    }

    /// Performs the API request with the OAuthSwift client
    ///
    /// - Parameters:
    ///   - parameters: Any URL parameters to pass to the endpoint.
    ///   - failure: failure callback
    ///   - success: success callback
    private func makeRequest(parameters: [String: String],
                             failure: @escaping (_ error: OAuthSwiftError) -> Void,
                             success: @escaping (_ response: OAuthSwiftResponse) -> Void) {
        let completionHandler: OAuthSwiftHTTPRequest.CompletionHandler? = { result in
            switch result {
            case .success(let response):
                success(response)
            case .failure(let error):
                failure(error)
            }
        }
        self.oauth?.client.request(url,
                                   method: .GET,
                                   parameters: parameters,
                                   headers: self.headers,
                                   body: nil,
                                   checkTokenExpiration: true,
                                   completionHandler: completionHandler)
    }
}
