//
//  HeaderView.swift
//  SkyScope
//
//  Created by Nafea Elkassas on 14/10/2025.
//

import SwiftUI

import SwiftUI

struct HeaderWeatherView: View {
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        VStack(spacing: 10) {
            Text(Constants.locationCity)
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(Color("myColor"))

            if let weather = viewModel.result {
                Text("\(weather.current.tempC, specifier: "%.f")°")
                    .font(.largeTitle)
                    .foregroundColor(Color("myColor"))

                Text(weather.current.condition.text)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("myColor"))

                HStack {
                    HStack {
                        Image(systemName: "arrowshape.down.fill")
                            .foregroundStyle(.blue)
                        Text("\(weather.forecast.forecastday.first?.day.mintempC ?? 21, specifier: "%.f")°")
                            .foregroundColor(Color("myColor"))
                    }

                    HStack {
                        Text("\(weather.forecast.forecastday.first?.day.maxtempC ?? 30, specifier: "%.f")°")
                            .foregroundColor(Color("myColor"))
                        Image(systemName: "arrowshape.up.fill")
                            .foregroundStyle(.red)
                    }
                }

                if let url = URL(string: "https:\(weather.current.condition.icon)") {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                    } placeholder: {
                        ProgressView()
                    }
                }
            }
        }
    }
}


#Preview {
    HeaderWeatherView(viewModel: MainViewModel())
}
