//
//  MainContentView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 31.07.2024.
//

import SwiftUI

struct MainContentView: View {
    
    @State private var targetMonth = Date().month
    @State private var showWidgets = true
    @State private var showChat = false
    
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
                    MainChartDetailView()
                    HStack {
                        MainContactsListView(isDetailList: true).hidden(!showWidgets)
                        VStack {
                            MainExternalView()
                            .hidden(!showWidgets)
                            MainSupportView().hidden(!showWidgets)
                                .opacity(showChat ? 0.2 : 1)
                                .onTapGesture {
                                    withAnimation {
                                        showChat.toggle()
                                    }
                                }
                        }
                    }
                }
                MainRightSideBar(monthSelected: $targetMonth)
                    .ignoresSafeArea()
                    .hidden(!showWidgets)
            }
        }
        .background(Colors.DarkPurple)

        .sheet(isPresented: $showChat) {
            ChatContentView()
                .presentationBackground(Colors.DarkPurple.opacity(0.2))
        }
    }
}

#Preview {
    MainContentView()
}
