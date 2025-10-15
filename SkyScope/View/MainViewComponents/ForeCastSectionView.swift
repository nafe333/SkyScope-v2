//
//  ForeCastSectionView.swift
//  SkyScope
//
//  Created by Nafea Elkassas on 14/10/2025.
//

import SwiftUI

struct ForecastSectionView: View {
    var forecastDays: [ForecastDay]
    @Binding var selectedDay: ForecastDay?

    var body: some View {
        VStack(alignment: .leading) {
            Text("3-Day Forecast")
                .opacity(0.5)
                .padding(.leading, 100)
                .foregroundColor(Color("myColor"))

            List(forecastDays, id: \.date) { day in
                DaysRowView(
                    dayName: formatDate(day.date),
                    iconName: day.day.condition.icon,
                    minTemp: day.day.mintempC,
                    maxTemp: day.day.maxtempC
                )
                .frame(height: 40)
                .listRowSeparator(.visible)
                .listRowBackground(Color.clear)
                .onTapGesture { selectedDay = day }
            }
            .listStyle(.plain)
            .frame(maxWidth: 340)
            .frame(maxWidth: .infinity, alignment: .center)
            .scrollContentBackground(.hidden)
        }
    }

    // MARK: - Helper
    private func formatDate(_ dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: dateString) else { return dateString }

        if Calendar.current.isDateInToday(date) { return "Today" }
        if Calendar.current.isDateInTomorrow(date) { return "Tomorrow" }

        let weekdayFormatter = DateFormatter()
        weekdayFormatter.dateFormat = "EEEE"
        return weekdayFormatter.string(from: date)
    }
}


#Preview {
    ForecastSectionView(
        forecastDays: [],
        selectedDay: .constant(nil)
    )
}
