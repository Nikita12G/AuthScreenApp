//
//  MainChartView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 26.08.2024.
//

import SwiftUI
import Charts

struct MainChartView: View {
    
    private var dataLastYear: [SalesOfYear]
    private var dataCurrentYear: [SalesOfYear]
    
    @Binding private var targetMonth: Int
    @State private var circlePosition: CGPoint = .zero
    
    init(dataLastYear: [SalesOfYear], dataCurrentYear: [SalesOfYear], targetMonth: Binding<Int>) {
        self.dataLastYear = dataLastYear
        self.dataCurrentYear = dataCurrentYear
        self._targetMonth = targetMonth
    }
    
    var body: some View {
        ZStack {
            ZStack {
                Chart {
                    ForEach(dataLastYear) { item in
                        AreaMark(
                            x: .value("Month", item.date, unit: .month),
                            y: .value("Sales", item.sailValue)
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
                    ForEach(dataLastYear) { item in
                        LineMark(
                            x: .value("Month", item.date, unit: .month),
                            y: .value("Sales", item.sailValue)
                        )
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(Colors.Blue)
                        .lineStyle(StrokeStyle(lineWidth: 3))
                    }
                }
                .chartXAxis {
                    AxisMarks(position: .bottom, values: .stride(by: .month)) { _ in
                        AxisValueLabel(format: .dateTime.month(.abbreviated)).font(Fonts.montserrat(ofSize: 12)).foregroundStyle(Colors.Grey)
                    }
                }
                .chartYAxis {
                    AxisMarks(position: .leading, values: .stride(by: 200)) { value in
                        AxisGridLine(stroke: StrokeStyle(lineWidth: 1, dash: [5, 5]))
                            .foregroundStyle(Colors.DarkGrey)
                        AxisValueLabel().font(Fonts.montserrat(ofSize: 12)).foregroundStyle(Colors.Grey)
                    }
                }
            }
            ZStack {
                Chart {
                    ForEach(dataCurrentYear) { item in
                        AreaMark(
                            x: .value("Month", item.date, unit: .month),
                            y: .value("Sales", item.sailValue)
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
                    ForEach(dataCurrentYear) { item in
                        LineMark(
                            x: .value("Month", item.date, unit: .month),
                            y: .value("Sales", item.sailValue)
                        )
                        .foregroundStyle(Colors.Purple)
                        .interpolationMethod(.catmullRom)
                        .lineStyle(StrokeStyle(lineWidth: 3))
                    }
                    if let selectedItem = dataCurrentYear.first(where: { Calendar.current.component(.month, from: $0.date) == targetMonth }) {
                        PointMark(
                            x: .value("Month", selectedItem.date, unit: .month),
                            y: .value("Sales", selectedItem.sailValue)
                        )
                        .symbol {
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerSize: CGSize(width: 42, height: 28))
                                        .frame(width: 42, height: 28)
                                        .foregroundStyle(Colors.White.opacity(0.08))
                                    Text(findClosestDataPoint(for: targetMonth, in: dataCurrentYear)?.sailValue.description ?? "")
                                        .font(Fonts.montserrat(ofSize: 14))
                                        .foregroundStyle(Colors.White)
                                }
                                MainPointView()
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
                            }
                        }
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
    private func findClosestDataPoint(for month: Int, in data: [SalesOfYear]) -> SalesOfYear? {
        let calendar = Calendar.current
        
        return data.min { (item1, item2) -> Bool in
            let month1 = calendar.component(.month, from: item1.date)
            let month2 = calendar.component(.month, from: item2.date)
            
            return abs(month - month1) < abs(month - month2)
        }
    }
}



#Preview {
    MainContentView()
}
