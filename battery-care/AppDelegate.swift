//
//  AppDelegate.swift
//  mojito
//
//  Created by Andre on 15.02.2024.
//

import Cocoa
import UserNotifications
import LaunchAtLogin



@NSApplicationMain
final class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_: Notification) {
        UserPreferences.registerDefaults()
        UNUserNotificationCenter.current().delegate = self
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (authorized, error) in
            if authorized {
                print("Granted")
            } else if !authorized {
                print("Not Granted")
            } else {
                print(error?.localizedDescription as Any)
            }
            
        }
    }
        
        
        func applicationWillTerminate(_: Notification) {
            // Insert code here to tear down your application
        }

        
        // Post messages to the user notification center.
        func userNotificationCenter(_: UNUserNotificationCenter,
                                    shouldPresentNotification _: UNUserNotificationCenter) -> Bool
        {
            true
        }
    
    
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        return completionHandler([.list, .sound])
    }
    
}

