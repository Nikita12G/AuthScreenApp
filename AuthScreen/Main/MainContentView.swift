//
//  MainContentView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 31.07.2024.
//

import SwiftUI

struct MainContentView: View {
    
    @State private var statistic = Statistic()
    @State private var targetMonth = Date().month
    @State private var showWidgets = true
    @State private var showChat = false
    @State private var targetTopic = "iOS 18"
    @StateObject private var newsViewModel = NewsViewModel()
    @StateObject private var footballViewModel = FootballViewModel()
    
    var body: some View {
        VStack {
            HStack {
                MainLeftSideBarView()
                    .ignoresSafeArea()
                VStack {
                    HStack(spacing: 24) {
                        Text("\(Constants.statisticTitle) \(footballViewModel.teamStatistics?.response?.team?.name ?? "")")
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
                    MainChartDetailView(scoredGoals: footballViewModel.getScoredGoalsForMinutes(), missedGoals: footballViewModel.getMissedGoalsForMinutes(), goalsDifference: footballViewModel.getTotalGoalDifference(), isLoading: newsViewModel.isLoading, errorMessage: $newsViewModel.errorMessage)
                    HStack {
                        MainContactsListView(isDetailList: true).hidden(!showWidgets)
                        VStack {
                            MainExternalView(
                                topic: $targetTopic,
                                topicsForNews: newsViewModel.topicsForNews,
                                allArticleCount: newsViewModel.articleList?.totalResults,
                                topicsArticleCount: newsViewModel.articleList?.articles?.count,
                                progressValue: newsViewModel.progressValue, isLoading: newsViewModel.isLoading, errorMessage: $newsViewModel.errorMessage)
                            .task(id: targetTopic) {
                                newsViewModel.fetchArticles(targetTopic: targetTopic)
                            }
                            .hidden(!showWidgets)
                            MainSupportView().hidden(!showWidgets)
                                .scaleEffect(showChat ? 1.1 : 1.0)
                                .opacity(showChat ? 0.2 : 1)
                                .onTapGesture {
                                    withAnimation {
                                        showChat.toggle()
                                    }
                                }
                        }
                    }
                }
                MainRightSideBar(statistic: _statistic, monthSelected: $targetMonth)
                    .ignoresSafeArea()
                    .hidden(!showWidgets)
            }
        }
        .background(Colors.DarkPurple)
        .task {
            newsViewModel.fetchArticles(targetTopic: targetTopic)
            footballViewModel.fetchTeamStatistics(season: 2020, teamId: 33, leagueId: 39)
        }
        .sheet(isPresented: $showChat) {
            ChatContentView()
                .presentationBackground(Colors.DarkPurple.opacity(0.2))
        }
    }
}

#Preview {
    MainContentView()
}
