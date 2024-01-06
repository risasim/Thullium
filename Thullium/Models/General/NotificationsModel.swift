//
//  NotificationsModel.swift
//  Thullium
//
//  Created by Richard on 20.12.2023.
//

import Foundation
import UserNotifications
import SwiftUI

func not_addNotification(title:String, subtitle:String){
    @AppStorage("notificationsAllowed") var notificationsAllowed:Bool = true
    if notificationsAllowed{
        print("notifications got here")
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) { _, error in
            if let error{
                print("Notification access not granted.", error.localizedDescription)
                notificationsAllowed = false
            }
        }
        
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = subtitle
        content.sound = .default
        
        print("Notification added")
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request)
    }
}
