//
//  BreakTimer.swift
//  Break Timer
//
//  Created by Coding on 10/10/20.
//

import Foundation
import SwiftUI

class BreakTimer:ObservableObject {
    var name:String
    private var timer:Timer? = nil
    var color:Color
    private var timerLength:Int
    @Published var timeRemaining:Int
    @Published var isPaused:Bool = true
    @Published var status:Float
    
    init(name: String, color: Color, timerLength: Int) {
        self.name = name
        self.color = color
        self.timerLength = timerLength
        self.timeRemaining = timerLength
        self.isPaused = true
        self.timer = nil
        self.status = 0.000000000
    }
    
    func startTimer()  {
        isPaused = false
    // 1. Make a new timer
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
            if self.timeRemaining > 0 {
//                self.time = self.timerLength - self.timeRemaining
                self.timeRemaining -= 1
                self.status = 1 - (Float(self.timeRemaining) / Float(self.timerLength))
            } else {
                self.timeRemaining = self.timerLength
                self.status = 0
            }
//            self.time = self.timerLength - self.timeRemaining
//            if self.time == 0 {
//                self.status = 0
//                self.timer?.invalidate()
//            } else {
//                self.status = Float(self.time) / Float(self.timerLength)
//            }
        }
    }
    
    func stopTimer() {
        isPaused = true
        timer?.invalidate()
        timer = nil
      }
    
    func restartTimer(){
        timeRemaining = timerLength
    }
}
