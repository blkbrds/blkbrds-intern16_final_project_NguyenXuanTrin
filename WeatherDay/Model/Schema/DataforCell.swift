//
//  Data.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/28/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class DataforCell {
    static func listEveryHours() -> [EveryHours] {
        let everyHoursArray: [EveryHours] = [
            EveryHours(percentOfRain: 28, weatherShowEveryHours: "", temperature: 25, timeEveryHours: "13:00"),
            EveryHours(percentOfRain: 28, weatherShowEveryHours: "", temperature: 25, timeEveryHours: "14:00"),
            EveryHours(percentOfRain: 45, weatherShowEveryHours: "", temperature: 30, timeEveryHours: "15:00"),
            EveryHours(percentOfRain: 28, weatherShowEveryHours: "", temperature: 28, timeEveryHours: "16:00"),
            EveryHours(percentOfRain: 28, weatherShowEveryHours: "", temperature: 30, timeEveryHours: "17:00"),
            EveryHours(percentOfRain: 28, weatherShowEveryHours: "", temperature: 24, timeEveryHours: "18:00"),
            EveryHours(percentOfRain: 28, weatherShowEveryHours: "", temperature: 22, timeEveryHours: "19:00"),
            EveryHours(percentOfRain: 28, weatherShowEveryHours: "", temperature: 25, timeEveryHours: "20:00"),
            EveryHours(percentOfRain: 28, weatherShowEveryHours: "", temperature: 25, timeEveryHours: "21:00"),
            EveryHours(percentOfRain: 28, weatherShowEveryHours: "", temperature: 24, timeEveryHours: "22:00"),
            EveryHours(percentOfRain: 28, weatherShowEveryHours: "", temperature: 22, timeEveryHours: "23:00"),
            EveryHours(percentOfRain: 28, weatherShowEveryHours: "", temperature: 23, timeEveryHours: "00:00"),]
        return everyHoursArray
    }

    static func listWeatherDaily() -> [WeatherDaily] {
        let listWeatherDaily: [WeatherDaily] = [
            WeatherDaily(dayOfWeek: "Monday", percentHumidity: 20, temperatureMin: 18, temperatureMax: 25),
            WeatherDaily(dayOfWeek: "Tuesday", percentHumidity: 80, temperatureMin: 20, temperatureMax: 25),
            WeatherDaily(dayOfWeek: "Wednesday", percentHumidity: 95, temperatureMin: 18, temperatureMax: 28),
            WeatherDaily(dayOfWeek: "Thursday", percentHumidity: 30, temperatureMin: 25, temperatureMax: 28),
            WeatherDaily(dayOfWeek: "Friday", percentHumidity: 25, temperatureMin: 21, temperatureMax: 25),
            WeatherDaily(dayOfWeek: "Saturday", percentHumidity: 24, temperatureMin: 20, temperatureMax: 28),
            WeatherDaily(dayOfWeek: "Sunday", percentHumidity: 28, temperatureMin: 25, temperatureMax: 27)
        ]
        return listWeatherDaily
    }
    
    static func cellWeatherDetails() -> WeatherDetails {
        let cellWeatherDetails: WeatherDetails = WeatherDetails(temperature: 28, humidity: 30, visibility: 40, uvIndex: "Low 1", dewpoint: 25)
        return cellWeatherDetails
    }
}
