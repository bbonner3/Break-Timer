//
//  TimerView.swift
//  Break Timer
//
//  Created by Coding on 10/10/20.
//

import SwiftUI

struct TimerView: View {
    @State private var timeRemaining = 100
    
    @State var hours:Int = 0
    @State var minutes:Int = 0
    @State var seconds:Int = 0
    
//    @State var isPaused:Bool = true
    
    @State var timer:Timer? = nil
    
    @ObservedObject var breakTimer:BreakTimer = BreakTimer(name: "Normal", color: .green, timerLength: 5)
    @State var timerStatusValue:Float = 0.0
    
//    @State var name:String = ""
    
    var body: some View {
        VStack {
            ZStack {
                Color.yellow
                    .opacity(0.1)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    TimerStatusBar(progress: self.$timerStatusValue)
                        .frame(width: 150.0, height: 150.0)
                        .padding(40.0)
                    
                    Spacer()
                }
                Text("\($breakTimer.timeRemaining.wrappedValue)")
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
                    if breakTimer.isPaused {
                        self.breakTimer.startTimer()
                    } else {
                        self.breakTimer.stopTimer()
                    }
                }, label: {
                    if breakTimer.isPaused {
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
                    breakTimer.stopTimer()
                    breakTimer.restartTimer()
                }, label: {
                    Text("􀛷")
                        .foregroundColor(.red)
                })
            }
        }
        .onAppear() {
//            breakTimer = BreakTimer(name: "Normal", color: .green, timerLength: 60)
            var breakTimer2 = BreakTimer(name: "Micro", color: .green, timerLength: 30)
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
