//
//  AuthInputPhoneTextField.swift
//  WBAuthScreen
//
//  Created by Никита Гуляев on 30.06.2024.
//

import SwiftUI

struct AuthInputPhoneTextField: View {
    
    @Binding private var text: String
    @State private var phoneNumber: String = ""
    @State private var phoneMask = Constants.authorisationPhoneMask
    
    
    init(text: Binding<String>) {
        self._text = text
    }
    
    var body: some View {
        HStack {
            TextField("", text: $phoneNumber)
                .font(Fonts.montserrat(ofSize: 16))
                .foregroundColor(Colors.White)
                .keyboardType(.numberPad)
                .textContentType(.telephoneNumber) 
                .onChange(of: phoneNumber) { _, newValue in
                    phoneNumber = newValue.formatPhoneNumber()
                    self.text = newValue
                }
                .placeholder() {
                    Text(phoneMask)
                        .foregroundColor(Colors.White)
                }
            Spacer()
                .overlay(
                    Button(action: {
                        phoneNumber = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .padding(.trailing, 5)
                    }
                        .hidden(phoneNumber.isEmpty)
                )
        }
    }
}

#Preview {
    AuthInputPhoneContentView(phoneNumber: .constant("+7 (923) 999-79-79"))
}
