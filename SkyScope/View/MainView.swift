//
//  ContentView.swift
//  SkyScope
//
//  Created by Nafea Elkassas on 13/10/2025.
//

import SwiftUI
import Lottie
struct MainView: View {
       //MARK: - Properties
    @StateObject private var viewModel = MainViewModel()
       @State private var selectedDay: ForecastDay?

    private var isNight: Bool {
        let hour = Calendar.current.component(.hour, from: Date())
        return !(hour >= 6 && hour < 18)
    }
    
    private var backgroundImageName: String {
        isNight ? "night" : "morningo"
    }
    private var animationName: String {
        isNight ? "Rain" : "weather"
    }
    
       var body: some View {
           NavigationStack {
               ZStack {
                   
                   Image(backgroundImageName)
                       .resizable()
                       .scaledToFill()
                       .ignoresSafeArea()
               VStack(spacing: 0) {
                   // animation view
                   
                   LottieView(name: animationName, loopMode: .loop)
                                           .frame(height: 60)
                                           .scaleEffect(0.4)
                                           .opacity(0.7)
                                           .padding(.top, 20)
                   
                   // MARK: - Header Section
                   HeaderWeatherView(viewModel: viewModel)
                       .foregroundColor(Color("myColor"))

                   // MARK: - Middle + Bottom Sections
                   if let forecastDays = viewModel.result?.forecast.forecastday,
                      let currentWeather = viewModel.result?.current {
                       
                       ForecastSectionView(
                           forecastDays: forecastDays,
                           selectedDay: $selectedDay
                       ).foregroundColor(Color("myColor"))
                       
                       WeatherGridSectionView(currentWeather: currentWeather)
                           .foregroundColor(Color("myColor"))
                   } else {
                       ProgressView("Loading Weather...")
                   }
               }
               .navigationDestination(item: $selectedDay) { day in
                   DayDetailsView(day: day)
               }
           }
               .preferredColorScheme(isNight ? .dark : .light)
       }
       }
}



#Preview {
    MainView()
}
