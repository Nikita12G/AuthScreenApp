//
//  MainContentView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 31.07.2024.
//

import SwiftUI

struct MainContentView: View {
    @State private var statistic = Statistic()
    @State private var dataLastYear = SalesOfYear.lastYear()
    @State private var dataCurrentYear = SalesOfYear.currentYear()
    @State private var percentageChange = SalesOfYear.percentageChange()
    @State private var targetMonth = Date().month
    
    var body: some View {
        VStack {
            HStack {
                MainLeftSideBarView()
                VStack {
                    MainChartDetailView(dataLastYear: dataLastYear, dataCurrentYear: dataCurrentYear, percentageChange: percentageChange, targetMonth: $targetMonth)
                    HStack {
                        MainContactsListView(isDetailList: true)
                        VStack {
                            MainExternalView(targetMonth: $targetMonth)
                            MainSupportView()
                        }
                    }
                }
                MainRightSideBar(statistic: _statistic, monthSelected: $targetMonth)
            }
        }
        .background(Colors.DarkPurple)
        
    }
}

#Preview {
    MainContentView()
}
