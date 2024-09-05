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
    @State private var targetTopic = "iOS 18"
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
                        MainChartDetailView(dataLastYear: dataLastYear, dataCurrentYear: dataCurrentYear, articleDifference: percentageChange, targetMonth: $targetMonth)
                        HStack {
                            MainContactsListView(isDetailList: true).hidden(!showWidgets)
                            VStack {
                                MainExternalView(
                                    topic: $targetTopic,
                                    topicsForNews: viewModel.topicsForNews,
                                    allArticleCount: viewModel.articleList?.totalResults,
                                    topicsArticleCount: viewModel.articleList?.articles?.count,
                                    progressValue: viewModel.progressValue)
                                    .onChange(of: targetTopic) { _, newTopic in
                                        targetTopic = newTopic
                                        viewModel.fetchArticles(targetTopic: newTopic)
                                    }
                                    .hidden(!showWidgets)
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
            viewModel.fetchArticles(targetTopic: targetTopic)
        }
    }
}

#Preview {
    MainContentView()
}
