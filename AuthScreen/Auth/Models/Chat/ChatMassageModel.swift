//
//  ChatMassageModel.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 06.09.2024.
//

import Foundation

struct Message: Identifiable {
    let id: UUID
    var text: String
    var isSentByUser: Bool
}
