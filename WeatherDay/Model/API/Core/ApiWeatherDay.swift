//
//  ApiWeatherDay.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/4/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import ObjectMapper
import Foundation
import Alamofire

extension APIManager.Forecasts {

    static func getForecastsByCity(location: String, completion: @escaping DataCompletion<Forecasts>) {
        ApiOAuth.shared.weather(location: location, failure: { (error) in
            print(error.localizedDescription)
        }, success: { (response) in
                guard let data = (try? response.jsonObject()) as? [String: Any] else {
                    completion(.failure(Api.Error.emptyData))
                    return
                }
                if let forecastList = data["forecasts"] as? JSArray,
                    let forecast = Mapper<Forecasts>().mapArray(JSONArray: forecastList).first {
                    completion(.success(forecast))
                } else {
                    completion(.failure(Api.Error.emptyData))
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
                        completion(.success(array))
                    } else {
                        completion(.failure(Api.Error.emptyData))
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
                if let current = data["current_observation"] as? JSObject, let condition = current["condition"] as? JSObject,
                    let conditionObj: ConditionToday = Mapper<ConditionToday>().map(JSONObject: condition) {
                    completion(.success(conditionObj))
                } else {
                    completion(.failure(Api.Error.emptyData))
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
                if let current = data["current_observation"] as? JSObject, let atmosphere = current["atmosphere"] as? JSObject,
                    let atmosphereObj = Mapper<Atmosphere>().map(JSONObject: atmosphere) {
                    completion(.success(atmosphereObj))
                } else {
                    completion(.failure(Api.Error.emptyData))
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
                if let location = data["location"] as? JSObject,
                    let locationObj = Mapper<Location>().map(JSONObject: location) {
                    completion(.success(locationObj))
                } else {
                    completion(.failure(Api.Error.emptyData))
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
                    if let current = data["current_observation"] as? JSObject,
                        let astronomy = current["astronomy"] as? JSObject,
                        let astronomyObj: Astronomy = Mapper<Astronomy>().map(JSONObject: astronomy) {
                        completion(.success(astronomyObj))
                    } else {
                        completion(.failure(Api.Error.emptyData))
                    }
                }, responseFormat: .json, unit: .metric)
        }
    }
}

extension APIManager.ForecastsEveryHours {
    static func getForecastsEveryHours(lat: Double, lon: Double, completion: @escaping DataCompletion<[ForecastsEveryHours]>) {
        let url: String = Api.Path.base_domain_forecasts + String(lat) + Api.Path.base_lon + String(lon) + Api.Path.base_hourly
        if let urlString = URL(string: url) {
            let urlRequest = URLRequest(url: urlString)
            URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
                guard let data = try? data?.jsonObject() as? [String: Any] else {
                    print("\(Api.Error.emptyData)")
                    return
                }
                if let result = data["hourly"] as? JSArray,
                    let results: [ForecastsEveryHours] = Mapper<ForecastsEveryHours>().mapArray(JSONObject: result) {
                    completion(.success(results))
                } else {
                    completion(.failure(Api.Error.emptyData))
                }
            }).resume()
        }
    }
}

extension APIManager.DailyWeather {
    static func getDailyWeather(lat: Double, lon: Double, completion: @escaping DataCompletion<DailyWeather>) {
        let url: String = Api.Path.base_domain_forecasts + String(lat) + Api.Path.base_lon + String(lon) + Api.Path.base_hourly
        if let urlString = URL(string: url) {
            let urlRequest = URLRequest(url: urlString)
            URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
                guard let data = try? data?.jsonObject() as? [String: Any] else {
                    print("\(Api.Error.emptyData)")
                    return
                }
                if let result = data["daily"] as? JSArray,
                    let dailyWeather: DailyWeather = Mapper<DailyWeather>().mapArray(JSONArray: result).first {
                    completion(.success(dailyWeather))
                } else {
                    completion(.failure(Api.Error.emptyData))
                }
            }).resume()
        }
    }
}

extension APIManager.Search {
    static func searchNameCityInTheWorld(completion: @escaping DataCompletion<[SearchProvince]>) {
        let url: String = "https://parseapi.back4app.com/classes/City?limit=1000&keys=name"
        if let urlString = URL(string: url) {
            var urlRequest = URLRequest(url: urlString)
            urlRequest.setValue("mxsebv4KoWIGkRntXwyzg6c6DhKWQuit8Ry9sHja", forHTTPHeaderField: "X-Parse-Application-Id") // This is the fake app's application id
            urlRequest.setValue("TpO0j3lG2PmEVMXlKYQACoOXKQrL3lwM0HwR9dbH", forHTTPHeaderField: "X-Parse-Master-Key") // This is the fake app's readonly master key
            URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
                guard let data = try? data?.jsonObject() as? [String: Any] else {
                    print("\(Api.Error.emptyData)")
                    return
                }
                if let result = data["results"] as? JSArray,
                    let results: [SearchProvince] = Mapper<SearchProvince>().mapArray(JSONObject: result) {
                    completion(.success(results))
                } else {
                    completion(.failure(Api.Error.emptyData))
                }
            }).resume()
        }
    }
    
    static func searchNameCityInVietNam(completion: @escaping DataCompletion<[SearchProvince]>) {
            let url: String = "https://thongtindoanhnghiep.co/api/city"
            if let urlString = URL(string: url) {
                let urlRequest = URLRequest(url: urlString)
                URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
                    guard let data = try? data?.jsonObject() as? [String: Any] else {
                        print("\(Api.Error.emptyData)")
                        return
                    }
                    if let result = data["LtsItem"] as? JSArray,
                        let results: [SearchProvince] = Mapper<SearchProvince>().mapArray(JSONObject: result) {
                        completion(.success(results))
                    } else {
                        completion(.failure(Api.Error.emptyData))
                    }
                }).resume()
            }
        }
}
