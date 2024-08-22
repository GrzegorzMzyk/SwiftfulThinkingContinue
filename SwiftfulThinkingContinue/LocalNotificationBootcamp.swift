//
//  LocalNotificationBootcamp.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 22/08/2024.
//

import SwiftUI
import UserNotifications

class NotificationManager {
    
    static let instance = NotificationManager() // Singleton
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options:options) { succes, error in
            if let error = error {
                print("error \(error)")
            } else {
                    print("succes")
            }
        }
    }
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "This is my first notification "
        content.subtitle = "This is soo easy"
        content.sound = .default
        content.badge = 0
        
        //trigger:
        // time
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        // calendar
        var dateComponents = DateComponents()
        dateComponents.hour = 14
        dateComponents.minute = 03
        dateComponents.weekday = 2
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
       //location
        
        
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}

struct LocalNotificationBootcamp: View {
    var body: some View {
       
        VStack(spacing:40) {
            Button("Request permission") {
                NotificationManager.instance.requestAuthorization()
            }
            Button("Schedule notification") {
                NotificationManager.instance.scheduleNotification()
            }
        }
    }
}

#Preview {
    LocalNotificationBootcamp()
}
