//
//  ContentView.swift
//  SkyScope
//
//  Created by Nafea Elkassas on 13/10/2025.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    var body: some View {
        VStack(spacing: 16) {
            if let weather = viewModel.result {
                Text(" \(weather.current.condition.text)")
                    .font(.title2)
                AsyncImage(url: URL(string: "https:\(weather.current.condition.icon)")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                } placeholder: {
                    ProgressView()
                }
                
                Text("Current: \(weather.current.tempC, specifier: "%.1f")°C")
                Text("Min: \(weather.forecast.forecastday.first?.day.mintempC ?? 0, specifier: "%.1f")°C")
                Text("Max: \(weather.forecast.forecastday.first?.day.maxtempC ?? 0, specifier: "%.1f")°C")
                Text("Humidity: \(weather.current.humidity)%")
                Text("Pressure: \(weather.current.pressureMb, specifier: "%.0f") mb")
                Text("Feels like: \(weather.current.feelslikeC, specifier: "%.1f")°C")
                Text("Visibility: \(weather.current.visKm, specifier: "%.1f") km")
            } else {
                ProgressView("Loading Weather...")
            }
        }
        .padding()
    }}

#Preview {
    MainView()
}
