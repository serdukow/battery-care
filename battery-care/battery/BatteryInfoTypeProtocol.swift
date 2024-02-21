//
//  BatteryInfoTypeProtocol.swift
//  mojito
//
//  Created by Andre on 15.02.2024.
//

import Foundation

@objc protocol BatteryInfoTypeProtocol {
    var title: String { get }
    var value: String { get }
}
