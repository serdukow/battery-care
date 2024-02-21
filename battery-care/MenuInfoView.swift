//
//  MenuInfoView.swift
//  mojito
//
//  Created by Andre on 15.02.2024.
//

import SwiftUI

@available(OSX 11.0, *)
struct MenuInfoView: View {
    @StateObject private var model = MenuInfoViewModel()

    let beige = Color(red: 0xD6 / 255.0, green: 0xCB / 255.0, blue: 0xC1 / 255.0)

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .bottom, spacing: 90) {
                Text("Battery")
                    .font(.system(size: 13, weight: .semibold))
                Spacer()
                Text(model.percentage)
                    .foregroundColor(.secondary)
                    .font(.system(size: 13))
                    .multilineTextAlignment(.trailing)
            }
            .padding(.bottom, 3)
            HStack(alignment: .bottom, spacing: 2) {
                Image(systemName: "bolt.fill")
                    .foregroundColor(beige)
                Text(model.powerSource)
                    .foregroundColor(.secondary)
                    .font(.system(size: 13))
                Text(model.currentCharge)
                    .foregroundColor(.secondary)
                    .font(.system(size: 13))
            }
            
            .padding(.bottom, UserPreferences.hideBatteryInfo ? 3 : 3)
            
            if UserPreferences.hideBatteryInfo {
                HStack(alignment: .top, spacing: 2) {
                    Image(systemName: "clock.fill")
                        .foregroundColor(beige)
                    Text(model.remaining)
                        .foregroundColor(.secondary)
                        .font(.system(size: 13))
                }
                .padding(.bottom, 3)
                HStack(alignment: .top, spacing: 2) {
                    Image(systemName: "arrow.counterclockwise.circle.fill")
                        .foregroundColor(beige)
                    Text(model.cycleCount)
                        .foregroundColor(.secondary)
                        .font(.system(size: 13))
                }
                .padding(.bottom, 3)
            }
            if UserPreferences.twentyPercentNotification && UserPreferences.eightyPercentNotification {
                HStack(alignment: .top, spacing: 2) {
                    Image(systemName: "bell.badge.fill")
                        .foregroundColor(beige)
                    Text("Notifications: All Enabled")
                        .foregroundColor(.secondary)
                        .font(.system(size: 13))
                }
                .padding(.bottom, -3)
            } else if UserPreferences.twentyPercentNotification {
                HStack(alignment: .top, spacing: 2) {
                    Image(systemName: "bell.badge.fill")
                           .foregroundColor(beige)
                    Text("Notifications: 20 % Enabled")
                        .foregroundColor(.secondary)
                        .font(.system(size: 13))
                }
                .padding(.bottom, -3)
            } else if UserPreferences.eightyPercentNotification {
                HStack(alignment: .top, spacing: 2) {
                    Image(systemName: "bell.badge.fill")
                           .foregroundColor(beige)
                    Text("Notifications: 80 % Enabled")
                        .foregroundColor(.secondary)
                        .font(.system(size: 13))
                }
                .padding(.bottom, -3)
            } else if !UserPreferences.twentyPercentNotification && !UserPreferences.eightyPercentNotification {
                HStack(alignment: .top, spacing: 2) {
                    Image(systemName: "bell.badge.slash.fill")
                           .foregroundColor(.red)
                    Text("Notifications: All Disabled")
                        .foregroundColor(.secondary)
                        .font(.system(size: 13))
                }
                .padding(.bottom, -3)
            }
        
        }
        .padding(.vertical, 7)
        .padding(.horizontal, 15)
    }
}


