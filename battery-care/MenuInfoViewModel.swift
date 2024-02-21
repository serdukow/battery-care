//
//  MenuInfoViewModel.swift
//  mojito
//
//  Created by Andre on 15.02.2024.
//

import Foundation

@available(OSX 11.0, *)
class MenuInfoViewModel: ObservableObject {
    @Published var powerSource = NSLocalizedString("Power Source Updating", comment: "")
    @Published var percentage = NSLocalizedString("Percentage Updating", comment: "")
    @Published var remaining = NSLocalizedString("Time Remaining Updating", comment: "")
    @Published var cycleCount = NSLocalizedString("Cycle Count Updating", comment: "")
    @Published var currentCharge = ""
    
    private let batteryService: BatteryService?

    init() {
        do {
            batteryService = try BatteryService()
        } catch {
            batteryService = nil
        }

        update()

    NotificationCenter.default
            .addObserver(self,
                         selector: #selector(MenuInfoViewModel.powerSourceChanged(_:)),
                         name: NSNotification.Name(rawValue: powerSourceChangedNotification),
                         object: nil)
    }

    @objc public func powerSourceChanged(_: AnyObject) {
        update()
    }

    private func update() {
        guard let percentage = batteryService?.percentage,
              let timeRemaining = batteryService?.timeRemaining,
              let cycleCount = batteryService?.cycleCount,
              let amperage = batteryService?.amperage,
              let powerSource = batteryService?.powerSource
        else {
            return
        }

        self.powerSource = powerSource.localizedDescription
        if !UserPreferences.hideBatteryInfo{
            self.percentage = percentage.formatted
        } else {
            self.percentage = percentage.formatted
            self.cycleCount = cycleCount.CycleCountLocalizedDescription
            self.remaining = timeRemaining.timeFormatted
            self.currentCharge = String(format: "(%i mA)", amperage)
        }
    }
}
