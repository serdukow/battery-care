//
//  PowerSource.swift
//  mojito
//
//  Created by Andre on 15.02.2024.
//

import Foundation

enum PowerSource: String {
    case unknown = "Unknown"
    case powerAdapter = "Charging"
    case battery = "Discharging"

    var localizedDescription: String {
        let key = "\(self.rawValue)"
        return NSLocalizedString(key, comment: "")
    }
}
