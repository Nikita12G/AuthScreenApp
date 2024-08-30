//
//  MainExternalView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 29.08.2024.
//

import SwiftUI

struct MainExternalView: View {
    @Binding private var targetMonth: Int
    @State private var externalData = ExternalTraffic.generateData(forMonth: Date().month)
    
    init(targetMonth: Binding<Int>) {
        self._targetMonth = targetMonth
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(Constants.externalTraffic)
                    .foregroundStyle(Colors.White)
                    .font(Fonts.montserrat(ofSize: 18))
                Picker("", selection: $targetMonth) {
                    ForEach((1...12), id: \.self) { selectedMonth in
                        Text(Date.formattedString(year: externalData.year, month: selectedMonth).capitalized)
                    }
                }.accentColor(Colors.Grey)
                    .font(Fonts.montserrat(ofSize: 14))
                    .onChange(of: targetMonth) { _, newMonth in
                        externalData = ExternalTraffic.generateData(forMonth: newMonth)
                    }
            }
            HStack {
                ZStack {
                    CirclePath()
                        .trim(from: 0, to: externalData.externalTrafficPercent)
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
                        Text("\(Int(externalData.externalTrafficPercent * 100)) %")
                            .font(Fonts.montserrat(ofSize: 36))
                            .foregroundStyle(Colors.White)
                        Text(Constants.fromAllPurchases)
                            .font(Fonts.montserrat(ofSize:14))
                            .foregroundStyle(Colors.Grey)
                    }
                }
                VStack(alignment: .leading) {
                    ZStack(alignment: .leading) {
                        
                        VStack(alignment: .leading) {
                            Text("\(externalData.newClientValue) \(Constants.peoplesShort)")
                                .font(Fonts.montserrat(ofSize: 16))
                                .foregroundStyle(Colors.White)
                            Text(Constants.newClients)
                                .font(Fonts.montserrat(ofSize: 12))
                                .foregroundStyle(Colors.Grey)
                        }.padding(12)
                    }
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 146, height: 63)
                            .foregroundStyle(Colors.White.opacity(0.04))
                        VStack(alignment: .leading) {
                            Text("\(externalData.allClientValue) \(Constants.peoplesShort)")
                                .font(Fonts.montserrat(ofSize: 16))
                                .foregroundStyle(Colors.White)
                            Text(Constants.totalFromExternalTraffic)
                                .font(Fonts.montserrat(ofSize: 12))
                                .foregroundStyle(Colors.Grey)
                        }.padding(12)
                    }
                }
            }
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
