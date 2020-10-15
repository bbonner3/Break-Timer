//
//  BreakTimer.swift
//  Break Timer
//
//  Created by Coding on 10/10/20.
//

import Foundation
import SwiftUI

class BreakTimer:ObservableObject {
    private var timer:Timer? = nil
    private var breakColor:Color = Color.red
    var name:String
    var timerColor:Color
    @Published var color:Color
    private var timerLength:Int
    private var breakLength:Int
    @Published var timeRemaining:Int
    @Published var timeToBreak:Int
    @Published var isPaused:Bool = true
    @Published var onBreak:Bool = false
    @Published var status:Float
    
    init(name: String, timerColor: Color, timerLength: Int, breakLength: Int) {
        self.breakColor = Color.red
        self.name = name
        self.timerColor = timerColor
        self.color = timerColor
        self.timerLength = timerLength
        self.breakLength = breakLength
        self.timeRemaining = timerLength
        self.timeToBreak = timerLength - breakLength
        self.isPaused = true
        self.onBreak = false
        self.timer = nil
        self.status = 0.000000000
    }
    
    func startTimer()  {
        isPaused = false
    // 1. Make a new timer
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
            if self.timeRemaining > self.breakLength {
                self.onBreak = false
                self.color = self.timerColor
                self.timeRemaining -= 1
                self.timeToBreak = self.timeRemaining - self.breakLength
                self.status = 1 - (Float(self.timeRemaining) / Float(self.timerLength))
            } else if self.timeRemaining <= self.breakLength && self.timeRemaining > 0 {
                self.onBreak = true
                self.color = self.breakColor
                self.timeRemaining -= 1
                self.status = 1 - (Float(self.timeRemaining) / Float(self.timerLength))
            } else {
                self.onBreak = false
                self.color = self.timerColor
                self.timeRemaining = self.timerLength
                self.timeToBreak = self.timeRemaining - self.breakLength
                self.status = 0
            }
        }
    }
    
    func stopTimer() {
        isPaused = true
        timer?.invalidate()
        timer = nil
        status = 0
      }
    
    func restartTimer(){
        timeRemaining = timerLength
    }
}
