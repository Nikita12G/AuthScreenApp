////
////  WSManager.swift
////  AuthScreen
////
////  Created by Никита Гуляев on 06.09.2024.
////
//
//import Foundation
//
//class WSManager {
//    public static let shared = WSManager() // создаем Синглтон
//    private init(){}
//    
//    private var dataArray = [МОДЕЛЬ_МОИХ_ДАННЫХ]()
//    
//    let webSocketTask = URLSession(configuration: .default).webSocketTask(with: URL(string: "wss://ТУТ_ВАШ_АДРЕС"*))
//    
//   //функция вызова подключения
//    public func connectToWebSocket() {
//        webSocketTask.resume()
//        self.receiveData() { _ in }
//    }
//    
////функция подписки на что либо
//    public func subscribeBtcUsd() {
//        let message = URLSessionWebSocketTask.Message.string("SUBSCRIBE: НА_ЧТО_ПОДПИСЫВАЕМСЯ")
//        webSocketTask.send(message) { error in
//            if let error = error {
//                print("WebSocket couldn’t send message because: \(error)")
//            }
//        }
//    }
//
////функция отписки от чего либо
//    public func unSubscribeBtcUsd() {
//           let message = URLSessionWebSocketTask.Message.string("UNSUBSCRIBE: ОТ_ЧЕГО_ОТПИСЫВАЕМСЯ ")
//           webSocketTask.send(message) { error in
//               if let error = error {
//                   print("WebSocket couldn’t send message because: \(error)")
//               }
//           }
//       }
//    
////функция получения данных, с эскейпингом чтобы получить данные наружу
//    func receiveData(completion: @escaping ([МОДЕЛЬ_МОИХ_ДАННЫХ]?) -> Void) {
//      webSocketTask.receive { result in
//        switch result {
//            case .failure(let error):
//              print("Error in receiving message: \(error)")
//            case .success(let message):
//              switch message {
//                case .string(let text):
//                    let data: Data? = text.data(using: .utf8)
//                    let srvData = try? CODABLE_МОДЕЛЬ_ТОГО_ЧТО_ДОЛЖНО_ПРИЙТИ.decode(from: data ?? Data())
//                    for singleData in srvData ?? [] {
//                        self.dataArray.append(МОДЕЛЬ_МОИХ_ДАННЫХ(параметр1:  singleData.parametr1, параметр2:  singleData.parametr2, параметр3:  singleData.parametr3))
//                    }
//
//                case .data(let data):
//// В вашем варианте данные могут приходить сразу сюда
//                    print("Received data: \(data)")
//              @unknown default:
//                debugPrint("Unknown message")
//              }
//              
//              self.receiveData() {_ in } // рекурсия
//        }
//      }
//        completion(self.dataArray) // отправляем в комплишн то что насобирали в нашу модель
//    }
//}
