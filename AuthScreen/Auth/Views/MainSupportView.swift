//
//  MainSupportView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 30.08.2024.
//

import SwiftUI

struct MainSupportView: View {
    var body: some View {
        ZStack {
            Image("supportImage")
                .cornerRadius(28)
            VStack(spacing: 12) {
                Text(Constants.supportTitle)
                    .font(Fonts.montserrat(ofSize: 18))
                    .foregroundStyle(Colors.White)
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 120, height: 36)
                        .foregroundStyle(LinearGradient(colors: [Colors.SupportBlackFirstGradientColor, Colors.SupportBlackSecondGradientColor], startPoint: .topLeading, endPoint: .bottomTrailing))
                    Button(action: {
                        print(Constants.needHelp)
                    }, label: {
                        Text(Constants.needHelp)
                            .font(Fonts.montserrat(ofSize: 12))
                            .foregroundStyle(Colors.White)
                    })
                }
            }
        }
    }
}

#Preview {
    MainSupportView()
}
