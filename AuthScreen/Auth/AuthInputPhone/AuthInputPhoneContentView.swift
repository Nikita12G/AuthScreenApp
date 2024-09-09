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
            Text(Constants.authorisationTitle)
                .font(Fonts.montserrat(ofSize: 24))
                .foregroundColor(Colors.White)
                .bold()
                .padding(EdgeInsets(top: 40, leading: 0, bottom: 28, trailing: 0))
            
            Image("UserAvatar")
            
            Text(Constants.authorisationSubtitle)
                .font(Fonts.montserrat(ofSize: 24))
                .foregroundColor(Colors.White)
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 32, trailing: 0))
            
            AuthInputPhoneView(phoneNumber: $phoneNumber, inputState: $inputState)
                .padding(EdgeInsets(top: 0, leading: 24, bottom: 24, trailing: 24))
                .onChange(of: phoneNumber) { _, _ in
                    inputState = .regular
                }
            
            Button {
                if phoneIsValid(phone: phoneNumber) {
                    router.navigate(to: .inputCode)
                } else {
                    inputState = .error
                }
            } label: {
                Text(Constants.authorisationRequestTitle)
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
    
    private func phoneIsValid(phone: String) -> Bool {
        let phoneNumber = phone.filter { $0.isNumber }
        
        if phoneNumber.count < 11 {
            return false
        }
        
        let regex = "^((8|\\+7)[\\- ]?)?(\\(?\\d{3}\\)?[\\- ]?)?[\\d\\- ]{7,10}$"
        
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let range = NSRange(location: 0, length: phone.count)
            
            if regex.firstMatch(in: phone, options: [], range: range) != nil {
                return true
            } else {
                return false
            }
        } catch {
            print("Invalid regex: \(error.localizedDescription)")
            return false
        }
    }
}

#Preview {
    AuthInputPhoneContentView(phoneNumber: .constant("+7 (923) 999-79-79"))
}
