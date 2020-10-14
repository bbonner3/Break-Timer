//
//  TimerView.swift
//  Break Timer
//
//  Created by Coding on 10/10/20.
//

import SwiftUI

struct TimerView: View {
    @State private var timeRemaining = 100
    
    @State var hours:Double = 0
    @State var minutes:Double = 0
    @State var seconds:Double = 0
    
//    @State var isPaused:Bool = true
    
    @State var timer:Timer? = nil
    
    @ObservedObject var breakTimer1:BreakTimer = BreakTimer(name: "Normal", color: .green, timerLength: 60)
    @ObservedObject var breakTimer2:BreakTimer = BreakTimer(name: "Nano", color: .red, timerLength: 30)
    @ObservedObject var breakTimer3:BreakTimer = BreakTimer(name: "Micro", color: .blue, timerLength: 15)
    
//    @State var name:String = ""
    
    var body: some View {
        VStack {
            ZStack {
                Color.yellow
                    .opacity(0.1)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    TimerStatusBar(status: self.$breakTimer3.status, color: self.$breakTimer3.color)
                        .frame(width: 150, height: 150)
                        .padding(40.0)
                }
                VStack {
                    TimerStatusBar(status: self.$breakTimer2.status, color: self.$breakTimer2.color)
                        .frame(width: 200, height: 200)
                        .padding(40.0)
                }
                VStack {
                    TimerStatusBar(status: self.$breakTimer1.status, color: self.$breakTimer1.color)
                        .frame(width: 250, height: 250)
                        .padding(40.0)
                }
//                Text("\($breakTimer.timeRemaining.wrappedValue)")
                Text($breakTimer1.timeRemaining.wrappedValue.description)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(Capsule()
                        .fill(Color.black)
                        .opacity(0.75)
                    )
            }
            HStack {
                Button(action: {
                    if breakTimer1.isPaused {
                        self.breakTimer1.startTimer()
                        self.breakTimer2.startTimer()
                        self.breakTimer3.startTimer()
                    } else {
                        self.breakTimer1.stopTimer()
                        self.breakTimer2.stopTimer()
                        self.breakTimer3.stopTimer()
                    }
                }, label: {
                    if breakTimer1.isPaused {
                        Text("􀊄")
                            .foregroundColor(.green)
//                            .padding(.all)
                    } else {
                        Text("􀊆")
                            .foregroundColor(.yellow)
//                            .padding(.all)
                    }
                })
                Button(action: {
                    breakTimer1.stopTimer()
                    breakTimer1.restartTimer()
                    breakTimer2.stopTimer()
                    breakTimer2.restartTimer()
                    breakTimer3.stopTimer()
                    breakTimer3.restartTimer()
                }, label: {
                    Text("􀛷")
                        .foregroundColor(.red)
                })
            }
        }
        .onAppear() {
//            breakTimer = BreakTimer(name: "Normal", color: .green, timerLength: 60)
//            var breakTimer2 = BreakTimer(name: "Micro", color: .green, timerLength: 30)
//            breakTimers?.append(breakTimer)
//            breakTimers?.append(breakTimer2)
        }
//        .onReceive(timer) { time in
//            if self.timeRemaining > 0 {
//                self.timeRemaining -= 1
//            }
//        }
        .frame(width: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .padding(50)
    }
    
//    func startTimer(){
//        isPaused = false
//        // 1. Make a new timer
//        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
//          // 2. Check time to add to H:M:S
//          if self.seconds == 59 {
//            self.seconds = 0
//            if self.minutes == 59 {
//              self.minutes = 0
//              self.hours = self.hours + 1
//            } else {
//              self.minutes = self.minutes + 1
//            }
//          } else {
//            self.seconds = self.seconds + 1
//          }
//        }
//      }
//
//    func stopTimer(){
//        isPaused = true
//        timer?.invalidate()
//        timer = nil
//      }
//
//    func restartTimer(){
//      hours = 0
//      minutes = 0
//      seconds = 0
//    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
