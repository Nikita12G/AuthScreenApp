//
//  AuthInputPhoneView.swift
//  WBAuthScreen
//
//  Created by Никита Гуляев on 30.06.2024.
//

import SwiftUI

struct AuthInputPhoneView: View {
    
    @Binding private var phoneNumber: String
    @Binding private var inputState: InputViewState
    
    init(phoneNumber: Binding<String>, inputState: Binding<InputViewState>) {
        self._phoneNumber = phoneNumber
        self._inputState = inputState
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                if inputState == .error {
                    Text("Некорректный формат номера")
                        .font(Fonts.montserrat(ofSize: 12))
                        .foregroundColor(Colors.Red)
                        .hidden(inputState == .regular)
                        .padding(EdgeInsets(top: 6.5, leading: 16, bottom: 0, trailing: 16))
                }
                
                AuthInputPhoneTextField(text: $phoneNumber)
                    .padding(EdgeInsets(top: inputState == .error ? 0 : 14, leading: 24, bottom: inputState == .error ? 6.5 : 14, trailing: 24))
                    .foregroundColor(Colors.White)
                    .font(Fonts.montserrat(ofSize: 16))
                    .keyboardType(.numberPad)
                    .onTapGesture {
                        inputState = .regular
                    }
            }
            .background(Colors.White.opacity(0.08))
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(inputState == .error ? Colors.Red : Colors.Purple, lineWidth: inputState == .error ? 1 : 0))
        }
    }
}

#Preview {
    AuthInputPhoneContentView(phoneNumber: .constant("+7 (923) 999-79-79"))
}
