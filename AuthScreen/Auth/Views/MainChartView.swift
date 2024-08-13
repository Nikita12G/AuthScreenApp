//
//  MainChartView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 02.08.2024.
//

import SwiftUI

struct MainChartView: View {
    private let ringRadius: CGFloat = 24.0
    private let lineWidth: CGFloat = 5.0
    
    private var imageName: String
    private var progress: Double
    private var title: String
    private var value: String
    
    init(imageName: String, progress: Double, title: String, value: String) {
        self.imageName = imageName
        self.progress = progress
        self.title = title
        self.value = value
    }
    
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .stroke(Colors.White
                        .opacity(0.08), lineWidth: lineWidth)
                    .frame(width: ringRadius * 2.0)
                Circle()
                    .trim(from: 0, to: CGFloat(progress))
                    .stroke(Colors.Purple,
                        style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .rotationEffect(Angle(degrees: 30))
                    .frame(width: ringRadius * 2.0)
                    .overlay(
                        Image(imageName)
                    )
            }
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(Fonts.montserrat(ofSize: 14))
                    .foregroundStyle(Colors.Grey)
                Text(value)
                    .font(Fonts.montserrat(ofSize: 18))
                    .foregroundStyle(Colors.White)
            }.padding(12)
        }
    }
}

#Preview {
    MainContentView()
}
