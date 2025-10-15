//
//  DayDetailsRowView.swift
//  SkyScope
//
//  Created by Nafea Elkassas on 13/10/2025.
//

import SwiftUI

struct DayDetailsRowView: View {
    var hourText = "Now"
    var hourTemperature = 15
    var iconUrl = ""
    
    var body: some View {
        HStack {
            Text(hourText)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(Color("myColor"))
                .frame(width: 60, alignment: .leading)

            Spacer()

            if let url = URL(string: "https:\(iconUrl)") {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                } placeholder: {
                    ProgressView().scaleEffect(0.6)
                }
            }

            Spacer()

            Text("\(hourTemperature)°")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(Color("myColor"))
                .frame(width: 40, alignment: .trailing)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)

    }
}

#Preview {
    DayDetailsRowView()
}
