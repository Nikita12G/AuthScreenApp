//
//  MainExternalView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 29.08.2024.
//

import SwiftUI

struct MainExternalView: View {
    
    @StateObject private var newsViewModel = NewsViewModel()
    @State private var topic = "iOS 18"
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text(Constants.newsCount)
                        .foregroundStyle(Colors.White)
                        .font(Fonts.montserrat(ofSize: 18))
                    Picker("", selection: $topic) {
                        ForEach(newsViewModel.topicsForNews, id: \.self) { topic in
                            Text(topic)
                        }
                    }.accentColor(Colors.Grey)
                        .font(Fonts.montserrat(ofSize: 14))
                        .onChange(of: topic) { _, newTopic in
                            topic = newTopic
                        }
                }.hidden(newsViewModel.isLoading || newsViewModel.errorMessage != nil)
                
                HStack {
                    ZStack {
                        CirclePath()
                            .trim(from: 0.1, to: (newsViewModel.progressValue ?? 0))
                            .stroke(
                                AngularGradient(
                                    gradient: Gradient(colors: [Colors.GraphikGreenGradientColor.opacity(0), Colors.GraphikGreenGradientColor.opacity(1)]),
                                    center: .center,
                                    startAngle: .degrees(0),
                                    endAngle: .degrees(280)
                                ),
                                style: StrokeStyle(lineWidth: 9.5, lineCap: .round)
                            )
                            .rotationEffect(Angle(degrees: 90))
                            .frame(width: 190, height: 190)
                        VStack {
                            Text(newsViewModel.articleList?.totalResults?.description ?? "0")
                                .font(Fonts.montserrat(ofSize: 36))
                                .foregroundStyle(Colors.White)
                            Text(Constants.allNews)
                                .font(Fonts.montserrat(ofSize: 14))
                                .foregroundStyle(Colors.Grey)
                        }
                    }
                    VStack(alignment: .leading) {
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: 146, height: 63)
                                .foregroundStyle(Colors.White.opacity(0.04))
                            VStack(alignment: .leading) {
                                Text(newsViewModel.articleList?.totalResults?.description ?? "0")
                                    .font(Fonts.montserrat(ofSize: 16))
                                    .foregroundStyle(Colors.White)
                                Text(Constants.allNews)
                                    .font(Fonts.montserrat(ofSize: 12))
                                    .foregroundStyle(Colors.Grey)
                            }.padding(12)
                        }
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: 146, height: 78)
                                .foregroundStyle(Colors.White.opacity(0.04))
                            VStack(alignment: .leading) {
                                Text(newsViewModel.articleList?.articles?.count.description ?? "0")
                                    .font(Fonts.montserrat(ofSize: 16))
                                    .foregroundStyle(Colors.White)
                                Text(Constants.loadNews)
                                    .font(Fonts.montserrat(ofSize: 12))
                                    .foregroundStyle(Colors.Grey)
                                    .lineLimit(nil)
                            }.padding(12)
                        }
                    }
                }.hidden(newsViewModel.isLoading || newsViewModel.errorMessage != nil)
            }
            if newsViewModel.isLoading {
                VStack(spacing: 20) {
                    ProgressView()
                        .frame(height: 50)
                        .tint(Colors.White)
                        .scaleEffect(2)
                    Text("Loading...")
                        .font(Fonts.montserrat(ofSize: 22))
                        .foregroundStyle(Colors.White)
                }
            } else if let errorMessage = newsViewModel.errorMessage {
                Text(errorMessage)
                    .font(Fonts.montserrat(ofSize: 18))
                    .foregroundStyle(Colors.White)
            }
        }.padding(EdgeInsets(top: 20, leading: 20, bottom: 24, trailing: 20))
            .background(AuthGradientView())
            .cornerRadius(28)
            .task(id: topic) {
                newsViewModel.fetchArticles(targetTopic: topic)
            }
            .task {
                newsViewModel.fetchArticles(targetTopic: newsViewModel.topicsForNews.first ?? topic)
            }
    }
}


private struct CirclePath: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.width / 2, y: rect.height / 2),
                    radius: rect.width / 2,
                    startAngle: .degrees(0),
                    endAngle: .degrees(280),
                    clockwise: false)
        return path
    }
}

#Preview {
    MainContentView()
}
