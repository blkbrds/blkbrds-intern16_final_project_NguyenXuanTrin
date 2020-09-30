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
            WeatherDaily(dayOfWeek: "Monday", temperatureMin: 18, temperatureMax: 25),
            WeatherDaily(dayOfWeek: "Tuesday", temperatureMin: 20, temperatureMax: 25),
            WeatherDaily(dayOfWeek: "Wednesday", temperatureMin: 18, temperatureMax: 28),
            WeatherDaily(dayOfWeek: "Thursday", temperatureMin: 25, temperatureMax: 28),
            WeatherDaily(dayOfWeek: "Friday", temperatureMin: 21, temperatureMax: 25),
            WeatherDaily(dayOfWeek: "Saturday", temperatureMin: 20, temperatureMax: 28),
            WeatherDaily(dayOfWeek: "Sunday", temperatureMin: 25, temperatureMax: 27)
        ]
        return listWeatherDaily
    }
}
