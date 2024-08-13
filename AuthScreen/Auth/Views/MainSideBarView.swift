//
//  MainSideBarView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 30.07.2024.
//

import SwiftUI

struct MainSideBarView: View {
    var body: some View {
        VStack() {
            Button {
                
            } label: {
                Image("UserAvatar")
                    .resizable()
                    .frame(width: 44, height: 44)
            }.padding(EdgeInsets(top: 32, leading: 18, bottom: 0, trailing: 18))
            Spacer()
            VStack(spacing: 56) {
                Button {
                    
                } label: {
                    Image("menuIcon").frame(width: 48, height: 48)
                }
                Button {
                    
                } label: {
                    Image("chatIcon").frame(width: 24, height: 24)
                }
                Button {
                    
                } label: {
                    Image("calendarIcon").frame(width: 24, height: 24)
                }
                Button {
                    
                } label: {
                    Image("settingsIcon").frame(width: 24, height: 24)
                }
            }
            Spacer()
            Button {
                
            } label: {
                Image("addApplication").frame(width: 48, height: 48)
            }.padding(EdgeInsets(top: 0, leading: 16, bottom: 32, trailing: 16))
        }.background(AuthGradientView())
    }
}

#Preview {
    MainContentView()
}
