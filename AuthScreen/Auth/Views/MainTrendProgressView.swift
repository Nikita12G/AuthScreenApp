//
//  MainTrendProgressView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 31.07.2024.
//

import SwiftUI

struct MainTrendProgressView: View {
    @State private var progress: Double
    @State private var isTarget: Bool
    @State private var monthValue: String
    
    init(progress: Double, isTarget: Bool, monthValue: String) {
        self.progress = progress
        self.isTarget = isTarget
        self.monthValue = monthValue
    }
    
    var body: some View {
        VStack(spacing: 6) {
            RoundedRectangle(cornerRadius: 4)
                .fill(isTarget ? Colors.Blue : Colors.White)
                .frame(width: 9 , height: 80 * progress)
            Text(monthValue)
                .font(Fonts.montserrat(ofSize: 12))
                .foregroundStyle(isTarget ? Colors.White : Colors.Grey)
        }
    }
}

#Preview {
    MainTrendsView()
}
