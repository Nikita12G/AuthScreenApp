//
//  MainChartDetailView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 23.08.2024.
//

import SwiftUI
import Charts

struct MainChartDetailView: View {
    
    @State private var dataLastYear: [SalesOfYear]
    @State private var dataCurrentYear: [SalesOfYear]
    @State private var percentageChange: Int
    
    init(dataLastYear: [SalesOfYear], dataCurrentYear: [SalesOfYear], percentageChange: Int) {
        self.dataLastYear = dataLastYear
        self.dataCurrentYear = dataCurrentYear
        self.percentageChange = percentageChange
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(Constants.sailsValueTitle)
                .font(Fonts.montserrat(ofSize: 18))
                .fontWeight(.bold)
                .foregroundStyle(Colors.White)
            HStack {
                Text("\(percentageChange)\(Constants.sailsPercent)")
                    .font(Fonts.montserrat(ofSize: 14))
                    .foregroundStyle(percentageChange > 0 ? Colors.Green : Colors.Red)
                Text(Constants.sailsRelative)
                    .font(Fonts.montserrat(ofSize: 14))
                    .foregroundStyle(Colors.Grey)
                    .padding(-5)
            }
            .padding(EdgeInsets(top: 6, leading: 0, bottom: 24, trailing: 0))
            MainChartView(dataLastYear: dataLastYear, dataCurrentYear: dataCurrentYear)
        }
        .padding(24)
        .background(AuthGradientView())
        .cornerRadius(28)
    }
}


#Preview {
    MainContentView()
}
