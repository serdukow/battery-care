//
//  NotificationKey.swift
//  mojito
//
//  Created by Andre on 15.02.2024.
//
/// - invalid: Not a valid notification
/// - twentyPercent: Notification at 20 %
/// - eightyPercent: Notification at 80 %
/// - hundredPercent: Fully charged notification

enum NotificationKey: Int {
    case invalid = 0
    case twentyPercent = 20
    case eightyPercent = 80
    case hundredpercent = 100
}
