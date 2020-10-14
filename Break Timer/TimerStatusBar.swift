//
//  TimerStatusBar.swift
//  Break Timer
//
//  Created by Coding on 10/12/20.
//

import SwiftUI

struct TimerStatusBar:View {
    @Binding var status:Float
    @Binding var color:Color
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.3)
                .foregroundColor(Color.red)
            
            Circle()
//                .trim(from: 0.0, to: CGFloat(min(self.status, 1.0)))
                .trim(from: 0.0, to: CGFloat(self.status))
                .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
//                .shadow(radius: 5)
                .foregroundColor(color)
                .rotationEffect(.degrees(-90))
                .animation(.linear)
        }
    }
}

//struct TimerStatusBar_Previews: PreviewProvider {
//    static var previews: some View {
//        TimerStatusBar(progress: 50)
//    }
//}
