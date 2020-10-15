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
    
    @State var disabled:Color = Color.gray
    
    @State var timer:Timer? = nil
    
    @State var breakTimers:[BreakTimer] = []
    
    @ObservedObject var breakTimer1:BreakTimer = BreakTimer(name: "Normal", timerColor: .green, timerLength: 60, breakLength: 10)
    @ObservedObject var breakTimer2:BreakTimer = BreakTimer(name: "Nano", timerColor: .yellow, timerLength: 30, breakLength: 10)
    @ObservedObject var breakTimer3:BreakTimer = BreakTimer(name: "Micro", timerColor: .blue, timerLength: 15, breakLength: 10)
    
    @State var alert = false
    var body: some View {
        VStack {
            ZStack {
                Color.yellow
                    .opacity(0.1)
                    .edgesIgnoringSafeArea(.all)
                if !breakTimers.isEmpty {
                    ForEach(breakTimers.indices) { i in
                        let size:CGFloat = CGFloat(50 * (i + 1) + 100)
                        VStack {
                            TimerStatusBar(status: self.$breakTimers[i].status, color: self.$breakTimers[i].color)
                                .frame(width: size, height: size)
                                .padding(40.0)
                        }
                    }
                }
                if($breakTimer1.onBreak.wrappedValue) {
                    Text($breakTimer1.timeRemaining.wrappedValue.description)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 5)
                        .background(Capsule()
                            .fill(Color.black)
                            .opacity(0.75)
                        )
                } else {
                    Text($breakTimer1.timeToBreak.wrappedValue.description)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 5)
                        .background(Capsule()
                            .fill(Color.black)
                            .opacity(0.75)
                        )
                }
                    
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
            breakTimers.append(self.breakTimer3)
            breakTimers.append(self.breakTimer2)
            breakTimers.append(self.breakTimer1)
            
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
