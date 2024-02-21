//
//  PreferenceKey.swift
//  mojito
//
//  Created by Andrei Serdiukov on 15.02.2024.
//
/// - showTime: Shows Time Remaining.
/// - hidePercentage: Hide Bar Percentage and Show Time Remaining.
/// - hideBatteryIcon: Hide Battery icon and Show Percentage Only.
/// - hideBatteryInfo: Hide All Battery info, like temp, condition, cycle count etc..
/// - firstNotification: First Notification at 20 % when Mac is discharged sufficiently
/// - secondNotification: Second Notification at 80 % when Mac is charged sufficiently

enum PreferenceKey: String {
    case showTime = "ShowTimePref"
    case hidePercentage = "HidePercentagePref"
    case hideBatteryIcon = "HideBatteryIconPref"
    case hideBatteryInfo = "HideBatteryInfoPref"
    case twentyPercentNotification = "TwentyPercentNotificationPref"
    case eightyPercentNotification = "EightyPercentNotificationPref"
    case lastNotification = "LastNotifiedPref"
}
