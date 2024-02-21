//
//  ApplicationMenuDelegate.swift
//  mojito
//
//  Created by Andre on 15.02.2024.
//

import SwiftUI

class ApplicationMenuDelegate: NSObject, NSMenuDelegate {
    
    // MARK: Public
    
    public func menuWillOpen(_ menu: NSMenu) {
        updateBatteryInfoItem(menu.item(at: 0))
    }
    
    override func awakeFromNib() {
        do {
            batteryService = try BatteryService()
        } catch {
            NSLog(error.localizedDescription)
        }
    }
    
    // MARK: Private
    
    private var batteryService: BatteryService!
    
    private func updateBatteryInfoItem(_ batteryInfoItem: NSMenuItem?) {
        guard let item = batteryInfoItem else {
            return
        }
        
        item.attributedTitle = getAttributedMenuItemTitle()
        if #available(OSX 11.0, *) {
            let hostingView = NSHostingView(rootView: MenuInfoView())
            hostingView.frame = NSRect(x: 0,
                                       y: 0,
                                       width: hostingView.intrinsicContentSize.width,
                                       height: hostingView.intrinsicContentSize.height)
            
            item.view = hostingView
        } else {
            item.attributedTitle = getAttributedMenuItemTitle()
        }
    }
    
    private func getAttributedMenuItemTitle() -> NSAttributedString {
        guard let powerSource = batteryService?.powerSource
        else {
            return NSAttributedString(string: NSLocalizedString("Unknown", comment: "Information missing"))
        }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = 3.0
        
        let powerSourceLabel = NSMutableAttributedString(
            string: powerSource.localizedDescription,
            attributes: [.font: NSFont.menuFont(ofSize: 13.0), .paragraphStyle: paragraphStyle])
        
        return powerSourceLabel
    }
    
}
