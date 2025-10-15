//
//  DayGridView.swift
//  SkyScope
//
//  Created by Nafea Elkassas on 13/10/2025.
//

import SwiftUI

struct DayGridView: View {
       //MARK: - Properties
    var title = "Visibility"
    var value = "10 km"
    
    var body: some View {
        VStack(spacing: 8){
            Text(title)
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundColor(.secondary)
                            .textCase(.uppercase)
                        
                        Text(value)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("myColor"))
        }
        .frame(maxWidth: .infinity, minHeight: 80)
        .padding(.vertical, 12)

        

    }
}

#Preview {
    DayGridView()
}
