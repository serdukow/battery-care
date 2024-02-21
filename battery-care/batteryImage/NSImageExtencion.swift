//
//  NSImageExtencion.swift
//  mojito
//
//  Created by Andre on 15.02.2024.
//

import Cocoa

extension NSImage {
    func drawThreePartImage(
        withStartCap startCap: NSImage,
        fill: NSImage,
        endCap: NSImage,
        inFrame frame: NSRect) -> NSImage
    {
        lockFocus()
        NSDrawThreePartImage(frame, startCap, fill, endCap, false, .copy, 1, false)
        unlockFocus()

        return self
    }
}
