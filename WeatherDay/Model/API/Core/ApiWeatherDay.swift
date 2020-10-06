//
//  ApiWeatherDay.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/4/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import ObjectMapper
import Foundation

extension APIManager.Forecasts {

    static func getForecastsByCity(location: String, completion: @escaping DataCompletion<Forecasts>) {
        ApiOAuth.shared.weather(location: location, failure: { (error) in
            print(error.localizedDescription)
        }, success: { (response) in
                guard let data = (try? response.jsonObject()) as? [String: Any] else {
                    completion(.failure(Api.Error.emptyData))
                    return
                }
                if let forecasts = data["forecasts"] as? JSArray {
                    if let forecasts: Forecasts = Mapper<Forecasts>().mapArray(JSONArray: forecasts).first {
                        completion(.success(forecasts))
                    } else {
                        completion(.failure(Api.Error.emptyData))
                    }
                }
            }, responseFormat: .json, unit: .metric)
    }

    static func getForecastsArrayByCity(location: String, completion: @escaping DataCompletion<[Forecasts]>) {
        ApiOAuth.shared.weather(location: location, failure: { (error) in
            print(error.localizedDescription)
        }, success: { (response) in
                do {
                    guard let data = try response.jsonObject() as? [String: Any] else {
                        completion(.failure(Api.Error.emptyData))
                        return
                    }
                    if let forecasts = data["forecasts"] as? JSArray {
                        let array: [Forecasts] = Mapper<Forecasts>().mapArray(JSONArray: forecasts)
                        if !array.isEmpty {
                            completion(.success(array))
                        } else {
                            completion(.failure(Api.Error.emptyData))
                        }
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }, responseFormat: .json, unit: .metric)
    }
}

extension APIManager.Condition {
    static func getCurrentByCity(location: String, completion: @escaping DataCompletion<ConditionToday>) {
        ApiOAuth.shared.weather(location: location, failure: { (error) in
            print(error.localizedDescription)
        }, success: { (response) in
                guard let data = (try? response.jsonObject()) as? [String: Any] else {
                    completion(.failure(Api.Error.emptyData))
                    return
                }
                if let current = data["current_observation"] as? JSObject, let condition = current["condition"] as? JSObject {
                    if let condition: ConditionToday = Mapper<ConditionToday>().map(JSONObject: condition) {
                        completion(.success(condition))
                    } else {
                        completion(.failure(Api.Error.emptyData))
                    }
                }
            }, responseFormat: .json, unit: .metric)
    }
}

extension APIManager.Atmosphere {
    static func getAtmosthereByCity(location: String, completion: @escaping DataCompletion<Atmosphere>) {
        ApiOAuth.shared.weather(location: location, failure: { (error) in
            print(error.localizedDescription)
        }, success: { (response) in
                guard let data = (try? response.jsonObject()) as? [String: Any] else {
                    completion(.failure(Api.Error.emptyData))
                    return
                }
                if let current = data["current_observation"] as? JSObject, let atmosphere = current["atmosphere"] as? JSObject {
                    if let atmosphere: Atmosphere = Mapper<Atmosphere>().map(JSONObject: atmosphere) {
                        completion(.success(atmosphere))
                    } else {
                        completion(.failure(Api.Error.emptyData))
                    }
                }
            }, responseFormat: .json, unit: .metric)
    }
}

extension APIManager.Location {
    static func getLocationByCity(location: String, completion: @escaping DataCompletion<Location>) {
        ApiOAuth.shared.weather(location: location, failure: { (error) in
            print(error.localizedDescription)
        }, success: { (response) in
                guard let data = (try? response.jsonObject()) as? [String: Any] else {
                    completion(.failure(Api.Error.emptyData))
                    return
                }
                if let location = data["location"] as? JSObject {
                    if let location: Location = Mapper<Location>().map(JSONObject: location) {
                        completion(.success(location))
                    } else {
                        completion(.failure(Api.Error.emptyData))
                    }
                }
            }, responseFormat: .json, unit: .metric)
    }
}

extension APIManager.Astronomy {
    static func getAstronomyByCity(location: String, completion: @escaping DataCompletion<Astronomy>) {
        DispatchQueue.main.async {
            ApiOAuth.shared.weather(location: location, failure: { (error) in
                print(error.localizedDescription)
            }, success: { (response) in
                    guard let data = (try? response.jsonObject()) as? [String: Any] else {
                        completion(.failure(Api.Error.emptyData))
                        return
                    }
                    if let current = data["current_observation"] as? JSObject, let astronomy = current["astronomy"] as? JSObject {
                        if let astronomy: Astronomy = Mapper<Astronomy>().map(JSONObject: astronomy) {
                            completion(.success(astronomy))
                        } else {
                            completion(.failure(Api.Error.emptyData))
                        }
                    }
                }, responseFormat: .json, unit: .metric)
        }
    }
}
