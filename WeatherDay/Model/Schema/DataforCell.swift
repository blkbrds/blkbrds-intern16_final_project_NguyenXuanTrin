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

    static func listAmountofRain() -> [AmountofRain] {
        let listAmountofRain: [AmountofRain] = [
            AmountofRain(statusOfRain: "Morning", humidity: 10),
            AmountofRain(statusOfRain: "Noon", humidity: 25),
            AmountofRain(statusOfRain: "Afternoon", humidity: 40),
            AmountofRain(statusOfRain: "Evening", humidity: 80)
        ]
        return listAmountofRain
    }

    static func provinceList() -> [Province] {
        let listProvince: [Province] = [
            Province(province: "An Giang"),
            Province(province: "Bà Rịa - Vũng Tàu"),
            Province(province: "Bắc Giang"),
            Province(province: "Bắc Kạn"),
            Province(province: "Bạc Liêu"),
            Province(province: "Bắc Ninh"),
            Province(province: "Bến Tre"),
            Province(province: "Bình Định"),
            Province(province: "Bình Dương"),
            Province(province: "Bình Phước"),
            Province(province: "Bình Thuận"),
            Province(province: "Cà Mau"),
            Province(province: "Cao Bằng"),
            Province(province: "Cần Thơ"),
            Province(province: "Đà Nẵng"),
            Province(province: "Đắk Lắk"),
            Province(province: "Đắk Nông"),
            Province(province: "Điện Biên"),
            Province(province: "Đồng Nai"),
            Province(province: "Đồng Tháp"),
            Province(province: "Gia Lai"),
            Province(province: "Hà Giang"),
            Province(province: "Hà Nam"),
            Province(province: "Hà Tĩnh"),
            Province(province: "Hải Phòng"),
            Province(province: "Hà Nội"),
            Province(province: "Hải Dương"),
            Province(province: "Hậu Giang"),
            Province(province: "Hòa Bình"),
            Province(province: "Hưng Yên"),
            Province(province: "Khánh Hòa"),
            Province(province: "Kiên Giang"),
            Province(province: "Kon Tum"),
            Province(province: "Lai Châu"),
            Province(province: "Lâm Đồng"),
            Province(province: "Lạng Sơn"),
            Province(province: "Lào Cai"),
            Province(province: "Long An"),
            Province(province: "Nam Định"),
            Province(province: "Nghệ An"),
            Province(province: "Ninh Bình"),
            Province(province: "Ninh Thuận"),
            Province(province: "Phú Thọ"),
            Province(province: "Quảng Bình"),
            Province(province: "Quảng Nam"),
            Province(province: "Quảng Ngãi"),
            Province(province: "Quảng Ninh"),
            Province(province: "Quảng Trị"),
            Province(province: "Sóc Trăng"),
            Province(province: "Sơn La"),
            Province(province: "TP HCM"),
            Province(province: "Tây Ninh"),
            Province(province: "Thái Bình"),
            Province(province: "Thái Nguyên"),
            Province(province: "Thanh Hóa"),
            Province(province: "Thừa Thiên Huế"),
            Province(province: "Tiền Giang"),
            Province(province: "Trà Vinh"),
            Province(province: "Tuyên Quang"),
            Province(province: "Vĩnh Long"),
            Province(province: "Vĩnh Phúc"),
            Province(province: "Yên Bái"),
            Province(province: "Phú Yên")]
        return listProvince
    }
}
