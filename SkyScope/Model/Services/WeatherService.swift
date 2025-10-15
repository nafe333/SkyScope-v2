//
//  WeatherService.swift
//  SkyScope
//
//  Created by Nafea Elkassas on 13/10/2025.
//

import Foundation
import CoreLocation
protocol ServiceProtocol {
    static func fetchDataFromJson(completion: @escaping (WeatherResponse?) -> Void)
}

class WeatherService: ServiceProtocol {
       //MARK: - Properties

    static func fetchDataFromJson(completion: @escaping (WeatherResponse?) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: URLRequest(url: URL(string: "\(Constants.baseUrl)/forecast.json?key=\(Constants.token)&q=\(Constants.lat),\(Constants.long)&days=3&aqi=no&alerts=no")!)) { data, response, error in
            guard let data = data else { return }
            do {
                let decodedResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                completion(decodedResponse)
            } catch {
                completion(nil)
            }
        }
            dataTask.resume()
    }
    
    
    
}
