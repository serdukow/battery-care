//
//  StatusNotification.swift
//  mojito
//
//  Created by Andre on 15.02.2024.
//

import UserNotifications


/// Posts user notifications about the current charging status.
struct StatusNotification {
    // MARK: Lifecycle

    /// Initializes a new StatusNotification.
    ///
    /// - parameter key: The notification key which to display a user notification for.
    /// - returns: An optional StatusNotification; Return nil when the notificationKey
    ///            is invalid or nil.
    init?(forState state: BatteryState?) {
        guard let state = state, state != .chargedAndPlugged else {
            return nil
        }
        guard let key = NotificationKey(rawValue: state.percentage.numeric ?? 0), key != .invalid else {
            return nil
        }
        self.notificationKey = key
    }
    
    

    // MARK: Internal

    /// Present a notification for the current battery status to the user
    func postNotification() {
        if self.shouldPresentNotification() {
            
            let content = createUserNotification()
            let request = UNNotificationRequest(identifier: String(self.notificationKey.rawValue), content: content, trigger: nil)
            UNUserNotificationCenter.current().add(request) { (error) in
            UserPreferences.lastNotified = self.notificationKey
                
            }
        }
    }

    // MARK: Private

    /// The current notification's key.
    private let notificationKey: NotificationKey

    /// Check whether to present a notification to the user or not. Depending on the
    /// users preferences and whether the user already got notified about the current
    /// percentage.
    ///
    /// - returns: Whether to present a notification for the current battery percentage
    private func shouldPresentNotification() -> Bool {
        (self.notificationKey != UserPreferences.lastNotified
            && UserPreferences.notifications.contains(self.notificationKey))
    }
    
    
    
    /// Create a user notification for the current battery status
    ///
    /// - returns: The user notification to display
    private func createUserNotification() -> UNNotificationContent {
        
        let content = UNMutableNotificationContent()
        
        content.title = self.getNotificationTitle()
        content.body = self.getNotificationText()
        content.sound = UNNotificationSound.default
        
        return content
    }


    /// Get the corresponding notification title for the current battery state
    ///
    /// - returns: The notification title
    private func getNotificationTitle() -> String {
        if self.notificationKey == .twentyPercent {
            return NSLocalizedString("Low Battery Notification Title", comment: "")
        }
        else if self.notificationKey == .eightyPercent {
            return NSLocalizedString("Battery Charged Notification Title", comment: "")
        }
        return NSLocalizedString("Battery Charged Notification Title", comment: "")
    }

    

    /// Get the corresponding notification text for the current battery state
    ///
    /// - returns: The notification text
    private func getNotificationText() -> String {
        if self.notificationKey == .twentyPercent {
            return NSLocalizedString("Low Battery Notification Text", comment: "")
        }
        else if self.notificationKey == .eightyPercent {
            return NSLocalizedString("Battery Charged Notification Text", comment: "")
        }
        return NSLocalizedString("Battery Charged Notification Text", comment: "")
    }

}
