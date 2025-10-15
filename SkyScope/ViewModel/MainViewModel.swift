//
//  MainViewModel.swift
//  SkyScope
//
//  Created by Nafea Elkassas on 13/10/2025.
//

import Foundation
class MainViewModel: ObservableObject {
    @Published var result: WeatherResponse?

    init() {
           getDataFromModel()
       }
    
    func getDataFromModel() {
        WeatherService.fetchDataFromJson { [weak self] data in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self?.result = data
            }
        }
    }
}
