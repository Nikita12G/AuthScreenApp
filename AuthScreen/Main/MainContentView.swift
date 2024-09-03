//
//  MainContentView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 31.07.2024.
//

import SwiftUI

struct MainContentView: View {
    @State private var statistic = Statistic()
    @State private var dataLastYear = NewsOfDay.lastYear()
    @State private var dataCurrentYear = NewsOfDay.currentYear()
    @State private var percentageChange = NewsOfDay.percentageChange()
    @State private var targetMonth = Date().month
    @State private var showWidgets = false
    @StateObject private var viewModel = NewsViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading... if API work")
                    .background(Colors.White)
            } else if let error = viewModel.error {
                Text("Error: \(error.localizedDescription)")
            } else {
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
                        MainChartDetailView(dataLastYear: viewModel.previousMonthData, dataCurrentYear: viewModel.currentMonthData, articleDifference: viewModel.articleDifference, targetMonth: $targetMonth)
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
                        .hidden(!showWidgets)
                }
            }
        }
        .background(Colors.DarkPurple)
        .onAppear {
            viewModel.fetchArticles(page: 1, topic: "iOS 18", year: "2024")
        }
    }
}

#Preview {
    MainContentView()
}
