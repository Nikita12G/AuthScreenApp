//
//  AuthGradientView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 04.09.2024.
//

import SwiftUI

 struct AuthGradientView: View {
     var body: some View {
         LinearGradient(gradient: Gradient(colors: [Colors.PurpleFirstGradient.opacity(94), Colors.PurpleSecondGradient.opacity(49)]),
                        startPoint: .leading,
                        endPoint: .trailing)
     }
 }

 #Preview {
     AuthGradientView()
 }
