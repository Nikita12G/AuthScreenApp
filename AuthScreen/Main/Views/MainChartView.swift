//
//  MainChartView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 26.08.2024.
//

import SwiftUI
import Charts

struct MainChartView: View {
    
    @State private var scoredGoals: [GoalsStatistic]
    @State private var missedGoals: [GoalsStatistic]
    
    init(scoredGoals: [GoalsStatistic], missedGoals: [GoalsStatistic]) {
        self.scoredGoals = scoredGoals
        self.missedGoals = missedGoals
    }
    
    var body: some View {
        ZStack {
            ZStack {
                Chart {
                    ForEach(scoredGoals) { item in
                        AreaMark(
                            x: .value("Time Range", item.startTime),
                            y: .value("Goals", item.goalValue)
                        )
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(
                            LinearGradient(
                                gradient: Gradient(colors: [Colors.GraphikBlueGradientSecondColor, Colors.GraphikBlueGradientFirstColor]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                    }
                    ForEach(scoredGoals) { item in
                        LineMark(
                            x: .value("Time Range", item.startTime),
                            y: .value("Goals", item.goalValue)
                        )
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(Colors.Blue)
                        .lineStyle(StrokeStyle(lineWidth: 3))
                    }
                }
                .chartXAxis {
                    AxisMarks(position: .bottom, values: .stride(by: .minute, count: 15)) { _ in
                        AxisValueLabel(format: .dateTime.minute())
                            .font(Fonts.montserrat(ofSize: 12))
                            .foregroundStyle(Colors.Grey)
                    }
                }
                .chartYAxis {
                    AxisMarks(position: .leading, values: .stride(by: 50)) { value in
                        AxisGridLine(stroke: StrokeStyle(lineWidth: 1, dash: [5, 5]))
                            .foregroundStyle(Colors.DarkGrey)
                        AxisValueLabel().font(Fonts.montserrat(ofSize: 12)).foregroundStyle(Colors.Grey)
                    }
                }
            }
            ZStack {
                Chart {
                    ForEach(missedGoals) { item in
                        AreaMark(
                            x: .value("Time Range", item.startTime),
                            y: .value("Goals", item.goalValue)
                        )
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(
                            LinearGradient(
                                gradient: Gradient(colors: [Colors.GraphikPinkGradientSecondColor, Colors.GraphikPinkGradientFirstColor]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                    }
                    ForEach(missedGoals) { item in
                        LineMark(
                            x: .value("Time Range", item.startTime),
                            y: .value("Goals", item.goalValue)
                        )
                        .foregroundStyle(Colors.Purple)
                        .interpolationMethod(.catmullRom)
                        .lineStyle(StrokeStyle(lineWidth: 3))
                    }
                }
                .chartYAxis {
                    AxisMarks(position: .leading) { value in
                        AxisGridLine()
                            .foregroundStyle(Color.clear)
                        AxisValueLabel().foregroundStyle(Color.clear)
                    }
                }
                .chartXAxis {
                    AxisMarks() { _ in
                        AxisValueLabel().foregroundStyle(Color.clear)
                    }
                }
            }
        }
    }
}



#Preview {
    MainContentView()
}
