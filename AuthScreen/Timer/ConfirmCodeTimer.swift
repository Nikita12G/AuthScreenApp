//
//  Timer.swift
//  WBAuthScreen
//
//  Created by Никита Гуляев on 05.07.2024.
//

import SwiftUI

class ConfirmCodeTimer: ObservableObject {
    
    @Published var counter: Int = 60
    var timer = Timer()
    
    init() {
        start()
    }
    
    func start() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.counter -= 1
            if self.counter == 0 {
                self.stop()
            }
        }
    }
    func stop() {
        self.timer.invalidate()
    }
    func reset() {
        self.counter = 60
        self.start()
    }
}
