//
//  WebSocketManager.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 06.09.2024.
//

import Foundation
import Starscream

class WebSocketManager: ObservableObject, WebSocketDelegate {
    private var socket: WebSocket?
    
    @Published var isConnected: Bool = false
    @Published var receivedMessage: String = ""
    @Published var errorMessage: String?
    
    @Published var messages: [Message] = []
    
    private let reconnectLimit = 3
    private var reconnectAttempts = 0
    
    init() {
        setupWebSocket()
    }
    
    private func setupWebSocket() {
        guard let url = URL(string: "ws://localhost:8080") else {
            assertionFailure("Invalid URL")
            return
        }
        var request = URLRequest(url: url)
        request.timeoutInterval = 5
        socket = WebSocket(request: request)
        socket?.delegate = self
    }
    
    func connect() {
        if reconnectAttempts < reconnectLimit {
            socket?.connect()
        } else {
            print("Reconnection attempt limit exceeded.")
        }
    }
    
    func disconnect() {
        socket?.disconnect()
    }
    
    func sendMessage(_ message: String) {
        socket?.write(string: message)
        let userMessage = Message(id: UUID(), text: message, isSentByUser: true)
        DispatchQueue.main.async {
            self.messages.append(userMessage)
        }
    }
    
    // MARK: WebSocketDelegate methods
    func didReceive(event: Starscream.WebSocketEvent, client: Starscream.WebSocketClient) {
        switch event {
        case .connected(let headers):
            print("WebSocket connected: \(headers)")
            DispatchQueue.main.async {
                self.isConnected = true
                self.reconnectAttempts = 0
            }
        case .disconnected(let reason, let code):
            print("WebSocket disconnected: \(reason) with code: \(code)")
            DispatchQueue.main.async {
                self.isConnected = false
                self.reconnectAttempts += 1
                self.connect()
            }
        case .text(let string):
            print("Received text: \(string)")
            DispatchQueue.main.async {
                self.receivedMessage = string
                let serverMessage = Message(id: UUID(), text: string, isSentByUser: false)
                self.messages.append(serverMessage)
            }
        case .error(let error):
            print("Error: \(String(describing: error))")
            DispatchQueue.main.async {
                self.errorMessage = String(describing: error)
            }
        default:
            break
        }
    }
}
