//
//  ContentView.swift
//  Break Timer
//
//  Created by Coding on 10/10/20.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        VStack {
            TimerView()
            Button("Schedule Notification") {
                let notificationCenter = UNUserNotificationCenter.current()
                notificationCenter.getNotificationSettings(completionHandler: { (settings) in
                    
                    if settings.authorizationStatus == .authorized {
                        let content = UNMutableNotificationContent()
                        content.title = "Feed the cat"
                        content.subtitle = "It looks hungry"
                        content.sound = UNNotificationSound.default

                        // show this notification five seconds from now
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                        // choose a random identifier
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                        

                        // add our notification request
                        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
                        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
                            if let error = error {
                                print(error.localizedDescription)
                            }
                        })
                    }
                })
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
