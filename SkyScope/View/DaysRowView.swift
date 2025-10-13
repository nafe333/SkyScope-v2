//
//  DaysRowView.swift
//  SkyScope
//
//  Created by Nafea Elkassas on 13/10/2025.
//

import SwiftUI

struct DaysRowView: View {
    // MARK: - Properties
    var dayName: String = "Today"
    var iconName: String = "sun.max.fill"
    var minTemp: Double = 7.8
    var maxTemp: Double = 15.5
    
    // MARK: - View
    var body: some View {
        HStack(spacing: 12) {
            // Left: Day name
            Text(dayName)
                .font(.title3)
                .fontWeight(.medium)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
                .frame(maxWidth: .infinity, alignment: .leading)
                .layoutPriority(2)
            
            // Center: Weather icon
            if let url = URL(string: "https:\(iconName)") {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                        .frame(maxWidth: .infinity, alignment: .center)
                } placeholder: {
                    ProgressView()

                }
            } else {
                Image(systemName: "questionmark.circle.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.gray)
                    .frame(width: 45, height: 45)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            
            // Right: Temperatures
            HStack(spacing: 6) {
                HStack(spacing: 4) {
                    Image(systemName: "arrowshape.down.fill")
                        .font(.caption2)
                        .foregroundColor(.blue)
                    Text("\(Int(minTemp))°")
                        .font(.headline)
                        .monospacedDigit()
                        .fixedSize(horizontal: true, vertical: false)
                }
                
                Text("-")
                    .font(.headline)
                
                HStack(spacing: 4) {
                    Text("\(Int(maxTemp))°")
                        .font(.headline)
                        .monospacedDigit()
                        .fixedSize(horizontal: true, vertical: false)
                    Image(systemName: "arrowshape.up.fill")
                        .font(.caption2)
                        .foregroundColor(.red)
                }
            }
            .frame(minWidth: 100, alignment: .trailing)
            .layoutPriority(1)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
    }
}

#Preview {
    DaysRowView()
}
