//
//  TimeRemaining.swift
//  mojito
//
//  Created by Andre on 15.02.2024.
//

import Foundation

struct TimeRemaining {
    let minutes: Int?
    let state: BatteryState?
    
    var formatted: String {
        guard let minutesRemaining = minutes, let batteryState = state else {
            return NSLocalizedString("Time Remaining Updating", comment: "")
        }
        
        if batteryState == .chargedAndPlugged {
            return NSLocalizedString("Battery Charged Notification Title", comment: "")
        }
        
        return String(format: "%d:%02d", arguments: [minutesRemaining / 60, minutesRemaining % 60])
    }
    var timeFormatted: String {
        guard let minutesRemaining = minutes, let batteryState = state else {
            return NSLocalizedString("Time Remaining Updating", comment: "")
        }
        let localizedStringFormat = NSLocalizedString("Time Remaining", comment: "")

        if batteryState == .chargedAndPlugged {
            return NSLocalizedString("Battery Charged Notification Title", comment: "")
        }

        return String(format: localizedStringFormat, arguments: [minutesRemaining / 60, minutesRemaining % 60])
    }
    
}
