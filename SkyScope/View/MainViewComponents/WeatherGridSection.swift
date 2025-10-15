//
//  WeatherGridSection.swift
//  SkyScope
//
//  Created by Nafea Elkassas on 14/10/2025.
//

import SwiftUI

struct WeatherGridSectionView: View {
    var currentWeather: CurrentWeather?

    var body: some View {
        let gridItems = createGridItems(from: currentWeather!)

        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
            ForEach(gridItems, id: \.title) { item in
                DayGridView(title: item.title, value: item.value)
            }
        }
        .padding(.horizontal, 20)
    }

    private func createGridItems(from currentWeather: CurrentWeather) -> [GridData] {
        [
            GridData(title: "VISIBILITY", value: String(format: "%.1f km", currentWeather.visKm)),
            GridData(title: "HUMIDITY", value: "\(currentWeather.humidity)%"),
            GridData(title: "FEELS LIKE", value: String(format: "%.f°", currentWeather.feelslikeC)),
            GridData(title: "PRESSURE", value: String(format: "%.0f", currentWeather.pressureMb))
        ]
    }
}


#Preview {
    WeatherGridSectionView(currentWeather: nil )
}
