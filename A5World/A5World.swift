//
//  A5World.swift
//  A5World
//
//  Created by Etienne Vautherin on 08/03/2026.
//


// MARK: - Shared A5 World

actor A5World {
    struct SharedGlobals: Sendable {
        var appName: String
        var accentColorName: String
        var soundEnabled: Bool
        var clipboardText: String
        var openedAccessories: Set<HistoricalAccessory>
    }

    private var globals: SharedGlobals

    init(appName: String = "System 5 Desk Accessories") {
        self.globals = SharedGlobals(
            appName: appName,
            accentColorName: "Blue",
            soundEnabled: true,
            clipboardText: "Welcome to Notepad",
            openedAccessories: [.calculator, .controlPanel, .notePad]
        )
    }

    func snapshot() -> SharedGlobals {
        globals
    }

    func setAccentColorName(_ name: String) {
        globals.accentColorName = name
    }

    func setSoundEnabled(_ enabled: Bool) {
        globals.soundEnabled = enabled
    }

    func setClipboardText(_ text: String) {
        globals.clipboardText = text
    }

    func openAccessory(_ accessory: HistoricalAccessory) {
        globals.openedAccessories.insert(accessory)
    }

    func closeAccessory(_ accessory: HistoricalAccessory) {
        globals.openedAccessories.remove(accessory)
    }
}
