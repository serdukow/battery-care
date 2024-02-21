//
//  UserPreferences.swift
//  mojito
//
//  Created by Andre on 15.02.2024.
//

import SwiftUI
import Cocoa
import LaunchAtLogin

/// Manages the user preferences.
final class UserPreferences: NSObject {

    
    // MARK: Internal
    
    /// True if the user wants the remaining time to be displayed within the menu bar.
    static var showTime: Bool {
        userDefaults.bool(forKey: PreferenceKey.showTime.rawValue)
    }

    /// Hide Menu Bar Percentage.
    static var hidePercentage: Bool {
        userDefaults.bool(forKey: PreferenceKey.hidePercentage.rawValue)
    }

    /// Hide Battery Icon.
    static var hideBatteryIcon: Bool {
        userDefaults.bool(forKey: PreferenceKey.hideBatteryIcon.rawValue)
    }
    
    /// Hide all battery info in Menu Bar.
    static var hideBatteryInfo: Bool {
        userDefaults.bool(forKey: PreferenceKey.hideBatteryInfo.rawValue)
    }

    /// True if the user wants a firsr notification between 0 - 60 %.
    static var twentyPercentNotification: Bool {
        userDefaults.bool(forKey: PreferenceKey.twentyPercentNotification.rawValue)
    }
    
    /// True if the user wants a second notification between 60 - 100 %.
    static var eightyPercentNotification: Bool {
        userDefaults.bool(forKey: PreferenceKey.eightyPercentNotification.rawValue)
    }
    

    /// Keeps the percentage the user was last notified.
    static var lastNotified: NotificationKey? {
        get {
            NotificationKey(rawValue: userDefaults.integer(forKey: PreferenceKey.lastNotification.rawValue))
        }
        set {
            guard let notificationKey = newValue else {
                return
            }
            userDefaults.set(notificationKey.rawValue, forKey: PreferenceKey.lastNotification.rawValue)
        }
    }
    
    
    
    /// A set of all percentages where the user is interested.
    static var notifications: Set<NotificationKey> {
        // Create an empty set.
        var result: Set<NotificationKey> = []
        // Check the users notification settings and
        // add enabled notifications to the result set.
        
        if twentyPercentNotification {
            result.insert(.twentyPercent)
        }
        if eightyPercentNotification {
            result.insert(.eightyPercent)
        }
        return result
    }

    /// Register user defaults.
    static func registerDefaults() {
        let defaultPreferences = [
            PreferenceKey.showTime.rawValue: false,
            PreferenceKey.hidePercentage.rawValue: false,
            PreferenceKey.hideBatteryInfo.rawValue: true,
            PreferenceKey.twentyPercentNotification.rawValue: false,
            PreferenceKey.eightyPercentNotification.rawValue: false,
            PreferenceKey.lastNotification.rawValue: 0,
        ] as [String: Any]

        userDefaults.register(defaults: defaultPreferences)
    }

    // MARK: Private

    /// Holds a reference to the standard user defaults.
    private static let userDefaults = UserDefaults.standard
    
}
