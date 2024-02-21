//
//  CycleCount.swift
//  mojito
//
//  Created by Andre on 15.02.2024.
//

import Foundation

struct CycleCount {
    var numeric: Int?


    var CycleCountLocalizedDescription: String {
        guard let cycleCount = numeric else {
            return NSLocalizedString("Cycle Count Updating", comment: "")
        }

        let localizedStringFormat = NSLocalizedString("Cycle Count Capacity", comment: "")
                return String(format: localizedStringFormat, cycleCount)
    }
}
