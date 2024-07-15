//
//  AuthInputCodeContentView.swift
//  WBAuthScreen
//
//  Created by Никита Гуляев on 04.07.2024.
//


import SwiftUI

struct AuthInputCodeContentView: View {
    
    @Binding private var phoneNumber: String
    @State private var inputCode: String = ""
    @State private var inputState: InputViewState = .regular
    @FocusState private var textFieldIsFocused: Bool
    @ObservedObject private var confirmCodeTimer = ConfirmCodeTimer()
    @ObservedObject private var router = Router.shared
    
    init(phoneNumber: Binding<String>) {
        self._phoneNumber = phoneNumber
    }
    
    var body: some View {
        VStack {
            VStack {
                Image("mailImage")
                    .padding(.top, 40)
                
                Text(phoneNumber)
                    .font(Fonts.montserrat(ofSize: 24))
                    .foregroundColor(Colors.White)
                    .padding(.top, 18)
                
                AuthInputCodeTextField(code: $inputCode, inputState: $inputState)
                    .padding(EdgeInsets(top: 24, leading: 24, bottom: 12, trailing: 24))
                    .focused($textFieldIsFocused)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.textFieldIsFocused = true
                        }
                    }
                
                Text("Неверный пароль")
                    .font(Fonts.montserrat(ofSize: 14))
                    .foregroundColor(Colors.Red)
                    .hidden(inputState != .error)
                
                Text("Запросить повторно через \(confirmCodeTimer.counter) сек")
                    .font(Fonts.montserrat(ofSize: 14))
                    .foregroundColor(Colors.White)
                    .padding(.top, 15)
                    .hidden(confirmCodeTimer.counter == 0)
                
                Button {
                    if codeIsValid(code: inputCode) {
                        inputState = .success
                        textFieldIsFocused = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            router.navigate(to: .waitScreen)
                        }
                    } else {
                        inputState = .error
                    }
                } label: {
                    Text("Авторизоваться")
                        .padding(14)
                }
                .frame(maxWidth: .infinity)
                .background( Colors.Purple)
                .font(Fonts.montserrat(ofSize: 16))
                .cornerRadius(12)
                .foregroundColor( Colors.White)
                .padding(EdgeInsets(top: 24, leading: 24, bottom: 48, trailing: 24))
            }
            .background(AuthGradientView())
            .cornerRadius(28)
            .padding(10)
            .padding(EdgeInsets(top: 100, leading: 0, bottom: 100, trailing: 0))
            .frame(width: 400, height: 429)
            
            Button {
                router.back()
            } label: {
                HStack(spacing: 4) {
                    Image(systemName: "chevron.left").foregroundColor(Colors.White)
                    
                    Text("Вернуться назад")
                        .font(Fonts.montserrat(ofSize: 14))
                        .foregroundColor(Colors.White)
                }
                .padding(.top, 32)
            }.navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    AuthInputCodeContentView(phoneNumber: .constant("+7 (923) 999-79-79"))
}
