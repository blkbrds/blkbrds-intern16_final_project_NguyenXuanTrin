//
//  ApiRequest.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/25/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import ObjectMapper
import Foundation

extension APIManager.Forecasts {

    struct QueryParam { }

//    static func getForecastsByCity(completion: @escaping APICompletion) {
//        ApiOAuth.shared.weather(location: "Da nang", failure: { (error) in
//            print(error.localizedDescription)
//        }, success: { (response) in
//                do {
//                    guard let data = (try? response.jsonObject()) as? [String: Any] else {
//                        completion(.failure(Error: "not parse data"))
//                        return
//                    }
//                    if let forecasts = data["forecasts"] as? JSArray {
//                        if let array: Forecasts = Mapper<Forecasts>().mapArray(JSONArray: forecasts).first {
//                            if array != nil {
//                                completion(.success(array))
//                            } else {
//                                completion(.failure(.error("eror")))
//                            }
//                        }
//                    }
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }, responseFormat: .json, unit: .metric)
//    }

}

extension APIManager.CurrentObservation {
//    static func getCurrentByCity(completion: @escaping APICompletion<CurrentObservation>) {
//        ApiOAuth.shared.weather(location: "Da nang", failure: { (error) in
//            print(error.localizedDescription)
//        }, success: { (response) in
//                do {
//                    guard let data = (try? response.jsonObject()) as? [String: Any] else {
//                        completion(.failure(.error("not parse data")))
//                        return
//                    }
//                    if let current = data["current_observation"] as? JSObject {
//                        if let currentObject: CurrentObservation = Mapper<CurrentObservation>().map(JSONObject: current) {
//                            if currentObject != nil {
//                                completion(.success(currentObject))
//                            } else {
//                                completion(.failure(.error("eror")))
//                            }
//                        }
//                    }
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }, responseFormat: .json, unit: .metric)
//    }
}
