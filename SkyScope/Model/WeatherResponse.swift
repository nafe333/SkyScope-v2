//
//  WeatherResponse.swift
//  SkyScope
//
//  Created by Nafea Elkassas on 13/10/2025.
//

import Foundation
struct WeatherResponse: Codable {
    let current: CurrentWeather
    let forecast: Forecast
}

struct CurrentWeather: Codable {
    let tempC: Double
    let feelslikeC: Double
    let humidity: Int
    let pressureMb: Double
    let visKm: Double
    let condition: WeatherCondition

    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case feelslikeC = "feelslike_c"
        case humidity
        case pressureMb = "pressure_mb"
        case visKm = "vis_km"
        case condition
    }
}

struct Forecast: Codable {
    let forecastday: [ForecastDay]
}

struct ForecastDay: Codable, Identifiable, Hashable {
    let id = UUID()
    let day: DayWeather
    let date: String
    let hour: [HourWeather]

    enum CodingKeys: String, CodingKey {
        case day, date, hour
    }
}

struct DayWeather: Codable, Hashable {
    let maxtempC: Double
    let mintempC: Double
    let condition: WeatherCondition

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case mintempC = "mintemp_c"
        case condition
    }
}

struct WeatherCondition: Codable, Hashable {
    let text: String
    let icon: String
}

struct HourWeather: Codable, Hashable {
    let time: String
    let tempC: Double
    let condition: WeatherCondition
    
    enum CodingKeys: String, CodingKey {
        case time
        case tempC = "temp_c"
        case condition
        
    }
}
