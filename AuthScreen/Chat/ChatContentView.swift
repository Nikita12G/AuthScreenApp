//
//  ChatContentView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 06.09.2024.
//

import SwiftUI

struct ChatContentView: View {
    @StateObject private var webSocketManager = WebSocketManager()
    @State private var messageToSend: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Text(Constants.supportTitle)
                    .font(.headline)
                    .padding(.leading)
                Spacer()
                if webSocketManager.isConnected {
                    Text(Constants.supportChatOnline)
                        .foregroundColor(.green)
                        .padding(.trailing)
                } else {
                    Text(Constants.supportChatOffline)
                        .foregroundColor(.red)
                        .padding(.trailing)
                }
            }
            .padding(.vertical, 10)
            .background(Colors.Grey.opacity(0.8))
            
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(webSocketManager.messages) { message in
                        HStack {
                            if message.isSentByUser {
                                Spacer()
                                Text(message.text)
                                    .padding()
                                    .background(Colors.Blue.opacity(0.8))
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                                    .frame(maxWidth: 300, alignment: .trailing)
                            } else {
                                Text(message.text)
                                    .padding()
                                    .background(Colors.Grey.opacity(0.3))
                                    .cornerRadius(12)
                                    .frame(maxWidth: 300, alignment: .leading)
                                Spacer()
                            }
                        }
                    }
                }
                .padding()
            }
            .background(Color.white)
            .cornerRadius(16)
            .padding()
            VStack {
                HStack {
                    TextField(Constants.supportChatEnterMassage, text: $messageToSend)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Colors.Grey.opacity(0.1))
                        .cornerRadius(12)
                    
                    Button(action: {
                        webSocketManager.sendMessage(messageToSend)
                        messageToSend = ""
                    }) {
                        Image(systemName: "paperplane.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.blue)
                            .padding()
                    }
                    .disabled(!webSocketManager.isConnected || messageToSend.isEmpty)
                }
                .padding()
                .background(Colors.Grey.opacity(0.2))
            }
            .onAppear {
                if !webSocketManager.isConnected {
                    webSocketManager.connect()
                }
            }
            .onDisappear {
                webSocketManager.disconnect()
            }
        }
        .frame(width: 400, height: 500)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 10)
    }
}

#Preview {
    ChatContentView()
}
