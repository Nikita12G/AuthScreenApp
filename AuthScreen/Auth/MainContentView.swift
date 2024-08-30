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
    @State private var showWidgets = true
    
    var body: some View {
        VStack {
            HStack {
                MainLeftSideBarView()
                    .ignoresSafeArea()
                VStack {
                    HStack(spacing: 24) {
                        Text(Constants.statisticTitle)
                            .font(Fonts.montserrat(ofSize: 24))
                            .foregroundStyle(Colors.White)
                        Spacer()
                            Button(action: {
                                withAnimation {
                                    showWidgets.toggle()
                                }
                            }, label: {
                                Image("widgetIcon")
                                Text(Constants.showWidgets)
                                    .font(Fonts.montserrat(ofSize: 14))
                                    .foregroundStyle(Colors.White)
                            })
                        Button(action: {
                            print("share tap")
                        }, label: {
                            Image("shareIcon")
                            Text(Constants.shareTitle)
                                .font(Fonts.montserrat(ofSize: 14))
                                .foregroundStyle(Colors.White)
                        })
                    }.padding(EdgeInsets(top: 30, leading: 20, bottom: 24, trailing: 24))
                    MainChartDetailView(dataLastYear: dataLastYear, dataCurrentYear: dataCurrentYear, percentageChange: percentageChange, targetMonth: $targetMonth)
                    HStack {
                        MainContactsListView(isDetailList: true).hidden(!showWidgets)
                        VStack {
                            MainExternalView(targetMonth: $targetMonth).hidden(!showWidgets)
                            MainSupportView().hidden(!showWidgets)
                        }
                    }
                }
                MainRightSideBar(statistic: _statistic, monthSelected: $targetMonth)
                    .ignoresSafeArea()
            }
        }
        .background(Colors.DarkPurple)
        
    }
}

#Preview {
    MainContentView()
}
