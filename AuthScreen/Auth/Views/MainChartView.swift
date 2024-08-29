//
//  MainChartView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 26.08.2024.
//

import SwiftUI
import Charts

struct MainChartView: View {
    @State private var dataLastYear: [SalesOfYear]
    @State private var dataCurrentYear: [SalesOfYear]
    @State private var selectedValue: Int?
    @State private var circlePosition: CGPoint = .zero
    
    init(dataLastYear: [SalesOfYear], dataCurrentYear: [SalesOfYear]) {
        self.dataLastYear = dataLastYear
        self.dataCurrentYear = dataCurrentYear
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
                        .foregroundStyle(Colors.Blue)
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
            }.chartOverlay { proxy in
                GeometryReader { geometry in
                    Rectangle().fill(Color.clear).contentShape(Rectangle())
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    let location = value.location

                                    if let xValue = proxy.value(atX: location.x, as: Date.self) {
                                        let allData = dataCurrentYear
                                        if let closestItem = findClosestDataPoint(to: xValue, in: allData) {
                                            selectedValue = Int(closestItem.sailValue)

                                            if let xPosition = proxy.position(forX: closestItem.date),
                                               let yPosition = proxy.position(forY: closestItem.sailValue) {
                                                circlePosition = CGPoint(x: xPosition, y: yPosition)
                                            }
                                        }
                                    }
                                }
                        )
                }
            }
            if let selectedValue {
                ZStack {
                    RoundedRectangle(cornerSize: CGSize(width: 42, height: 28))
                        .frame(width: 42, height: 28)
                        .foregroundStyle(Colors.White.opacity(0.08))
                    Text(selectedValue.description)
                        .font(Fonts.montserrat(ofSize: 14))
                        .foregroundStyle(Colors.White)
                }
                .position(x: circlePosition.x, y: circlePosition.y - 40)
                MainPointView()
                    .position(circlePosition)
            }
        }
    }
    
    private func findClosestDataPoint(to date: Date, in data: [SalesOfYear]) -> SalesOfYear? {
        return data.min(by: { abs($0.date.timeIntervalSince(date)) < abs($1.date.timeIntervalSince(date)) })
    }
}

#Preview {
    MainContentView()
}
