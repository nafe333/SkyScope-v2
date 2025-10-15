//
//  DayDetailsView.swift
//  SkyScope
//
//  Created by Nafea Elkassas on 14/10/2025.
//

import SwiftUI

struct DayDetailsView: View {
       //MARK: - Properties
    let day: ForecastDay
    private var isNight: Bool {
        let hour = Calendar.current.component(.hour, from: Date())
        return !(hour >= 6 && hour < 18)
    }
    
    private var backgroundImageName: String {
        isNight ? "night" : "morning"
    }

    var body: some View {
        ZStack {
            Image(backgroundImageName)
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
        
        List(filteredHours.indices, id: \.self) { index in
            let hour = filteredHours[index]
            let hourText = (isToday && index == 0) ? "Now" : formattedHour(hour.time)
            
            DayDetailsRowView(
                hourText: hourText,
                hourTemperature: Int(hour.tempC),
                iconUrl: hour.condition.icon
            )
            .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .listRowBackground(Color.clear)
            
        }
        .scrollContentBackground(.hidden)
    }
        .preferredColorScheme(isNight ? .dark : .light)
                .navigationTitle("Hourly Forecast")
                .navigationBarTitleDisplayMode(.inline)
    }
        
    
    
    // MARK: - Helper Methods
    
    private var isToday: Bool {
           guard let date = dateFrom(day.date) else { return false }
           return Calendar.current.isDateInToday(date)
       }
       
       private var filteredHours: [HourWeather] {
           guard let date = dateFrom(day.date) else { return day.hour }
           if Calendar.current.isDateInToday(date) {
               let now = Date()
               return day.hour.filter { hour in
                   if let hourDate = dateFrom(hour.time) {
                       return hourDate >= now
                   }
                   return false
               }
           } else {
               return day.hour
           }
       }
       
       // MARK: - Helper Methods
       private func formattedHour(_ dateString: String) -> String {
           let formatter = DateFormatter()
           formatter.dateFormat = "yyyy-MM-dd HH:mm"
           if let date = formatter.date(from: dateString) {
               let hourFormatter = DateFormatter()
               hourFormatter.dateFormat = "h a"
               return hourFormatter.string(from: date)
           }
           return dateString
       }

       private func dateFrom(_ dateString: String) -> Date? {
           let formatter = DateFormatter()
           formatter.dateFormat = "yyyy-MM-dd HH:mm"
           if let date = formatter.date(from: dateString) {
               return date
           }
           formatter.dateFormat = "yyyy-MM-dd"
           return formatter.date(from: dateString)
       }
}


//#Preview {
//    DayDetailsView(day: <#ForecastDay#>)
//}
