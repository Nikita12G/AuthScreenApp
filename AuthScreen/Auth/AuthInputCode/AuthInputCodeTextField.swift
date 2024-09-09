//
//  AuthInputCodeTextField.swift
//  WBAuthScreen
//
//  Created by Никита Гуляев on 04.07.2024.
//

import SwiftUI

struct AuthInputCodeTextField: View {
    
    @Binding private var code: String
    @Binding private var inputState: InputViewState
    
    init(code: Binding<String>, inputState: Binding<InputViewState>) {
        self._code = code
        self._inputState = inputState
    }
    
    var body: some View {
        ZStack {
            HStack(spacing: 24) {
                ForEach(0..<4, id: \.self) { index in
                    Text(index < code.count ? String(code[code.index(code.startIndex, offsetBy: index)]) : " ")
                        .frame(width: 64, height: 80)
                        .background(Colors.White.opacity(0.08))
                        .cornerRadius(12)
                        .foregroundColor(Colors.White)
                        .font(Fonts.montserrat(ofSize: 34))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Colors.Red, lineWidth: inputState == .error ? 1 : 0))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Colors.Green, lineWidth: inputState == .success ? 1 : 0))
                }
            }
            .background(AuthGradientView())
            
            TextField("", text: $code)
                .keyboardType(.numberPad)
                .foregroundColor(.clear)
                .accentColor(.clear)
                .textContentType(.oneTimeCode)
                .onChange(of: code) { _, newValue in
                    let filtered = newValue.filter { $0.isNumber }
                    if filtered.count <= 4 {
                        code = filtered
                    } else {
                        code = String(filtered.prefix(4))
                    }
                }
        }
    }
}

#Preview {
    AuthInputCodeContentView(phoneNumber: .constant("+7 (923) 999-79-79"))
}
