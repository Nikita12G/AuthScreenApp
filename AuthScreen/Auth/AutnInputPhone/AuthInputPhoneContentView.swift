//
//  AuthInputPhoneContentView.swift
//  WBAuthScreen
//
//  Created by Никита Гуляев on 30.06.2024.
//

import SwiftUI

struct AuthInputPhoneContentView: View {
    
    @Binding private var phoneNumber: String
    @ObservedObject private var router = Router.shared
    @State private var inputState: InputViewState = .regular
    
    init(phoneNumber: Binding<String>) {
        self._phoneNumber = phoneNumber
    }
    
    var body: some View {
        VStack {
            Text("Авторизация")
                .font(Fonts.montserrat(ofSize: 24))
                .foregroundColor(Colors.White)
                .bold()
                .padding(EdgeInsets(top: 40, leading: 0, bottom: 28, trailing: 0))
            
            Image("UserAvatar")
            
            Text("Вход по номеру телефона")
                .font(Fonts.montserrat(ofSize: 24))
                .foregroundColor(Colors.White)
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 32, trailing: 0))
            
            AuthInputPhoneView(phoneNumber: $phoneNumber, inputState: $inputState)
                .padding(EdgeInsets(top: 0, leading: 24, bottom: 24, trailing: 24))
            
            Button {
                if phoneIsValid(phone: phoneNumber) {
                    router.navigate(to: .inputCode)
                } else {
                    inputState = .error
                }
            } label: {
                Text("Запросить код")
                    .padding(14)
            }
            .frame(maxWidth: .infinity)
            .background( Colors.Purple)
            .font(Fonts.montserrat(ofSize: 16))
            .cornerRadius(12)
            .foregroundColor( Colors.White)
            .padding(EdgeInsets(top: 0, leading: 24, bottom: 48, trailing: 24))
        }
        .background(AuthGradientView())
        .cornerRadius(28)
        .padding(10)
        .frame(width: 400, height: 429)
    }
}

#Preview {
    AuthInputPhoneContentView(phoneNumber: .constant("+7 (923) 999-79-79"))
}