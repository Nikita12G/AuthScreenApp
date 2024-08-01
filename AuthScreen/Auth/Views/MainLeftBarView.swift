//
//  MainLeftBarView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 30.07.2024.
//

import SwiftUI

struct MainLeftBarView: View {
    var body: some View {
        VStack() {
            Button {
                
            } label: {
                Image("UserAvatar").frame(width: 80, height: 44)
            }.padding(EdgeInsets(top: 32, leading: 18, bottom: 0, trailing: 18))
            Spacer()
            Button {
                
            } label: {
                Image("menuIcon").frame(width: 48, height: 48)
            }
            Button {
                
            } label: {
                Image("chatIcon")
            }
            Button {
                
            } label: {
                Image("calendarIcon")
            }
            Button {
                
            } label: {
                Image("settingsIcon")
            }
            Spacer()
            Button {
                
            } label: {
                Image("addApplication").frame(width: 48, height: 48)
            }.padding(EdgeInsets(top: 0, leading: 16, bottom: 32, trailing: 16))
        }.background( LinearGradient(gradient: Gradient(colors: [Colors.PurpleFirstGradient, Colors.PurpleSecondGradient]), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

#Preview {
    MainLeftBarView()
}
