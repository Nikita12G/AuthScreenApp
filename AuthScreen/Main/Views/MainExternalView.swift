//
//  MainExternalView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 29.08.2024.
//

import SwiftUI

struct MainExternalView: View {
    @Binding private var topic: String
    @Binding private var errorMessage: String?
    private var topicsForNews: [String]
    private var allArticleCount: Int?
    private var topicsArticleCount: Int?
    private var progressValue: CGFloat?
    private var isLoading: Bool
    
    init(topic: Binding<String>, topicsForNews: [String], allArticleCount: Int?, topicsArticleCount: Int?, progressValue: CGFloat?, isLoading: Bool, errorMessage: Binding<String?>) {
        self._topic = topic
        self.topicsForNews = topicsForNews
        self.allArticleCount = allArticleCount
        self.topicsArticleCount = topicsArticleCount
        self.progressValue = progressValue
        self.isLoading = isLoading
        self._errorMessage = errorMessage
    }
    
    var body: some View {
        VStack {
            if isLoading {
                VStack(spacing: 20) {
                    ProgressView()
                        .frame(height: 50)
                        .tint(Colors.White)
                        .scaleEffect(2)
                    Text("Loading...")
                        .font(Fonts.montserrat(ofSize: 22))
                        .foregroundStyle(Colors.White)
                }
            } else if let errorMessage = errorMessage {
                Text(errorMessage)
                    .font(Fonts.montserrat(ofSize: 18))
                    .foregroundStyle(Colors.White)
            }
            HStack {
                Text(Constants.newsCount)
                    .foregroundStyle(Colors.White)
                    .font(Fonts.montserrat(ofSize: 18))
                Picker("", selection: $topic) {
                    ForEach(topicsForNews, id: \.self) { topic in
                        Text(topic)
                    }
                }.accentColor(Colors.Grey)
                    .font(Fonts.montserrat(ofSize: 14))
                    .onChange(of: topic) { _, newTopic in
                        topic = newTopic
                    }
            }.hidden(isLoading || errorMessage != nil)

            HStack {
                ZStack {
                    CirclePath()
                        .trim(from: 0.1, to: (progressValue ?? 0))
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
                        Text(allArticleCount?.description ?? "0")
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
                            Text(allArticleCount?.description ?? "0")
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
                            Text(topicsArticleCount?.description ?? "0")
                                .font(Fonts.montserrat(ofSize: 16))
                                .foregroundStyle(Colors.White)
                            Text(Constants.loadNews)
                                .font(Fonts.montserrat(ofSize: 12))
                                .foregroundStyle(Colors.Grey)
                                .lineLimit(nil)
                        }.padding(12)
                    }
                }
            }.hidden(isLoading || errorMessage != nil)
        }.padding(EdgeInsets(top: 20, leading: 20, bottom: 24, trailing: 20))
            .background(AuthGradientView())
            .cornerRadius(28)
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
