//
//  AppModel.swift
//  A5World
//
//  Created by Etienne Vautherin on 08/03/2026.
//

import Observation

// MARK: - MainActor bridge to SwiftUI

@MainActor
@Observable
final class AppModel {
    var sharedGlobals: A5World.SharedGlobals
    var selectedAccessory: HistoricalAccessory = .calculator

    let a5World: A5World

    init(a5World: A5World = A5World()) {
        self.a5World = a5World
        self.sharedGlobals = .init(
            appName: "Loading...",
            accentColorName: "Blue",
            soundEnabled: true,
            clipboardText: "",
            openedAccessories: []
        )

        Task {
            await refresh()
        }
    }

    func refresh() async {
        sharedGlobals = await a5World.snapshot()
    }

    func selectAccessory(_ accessory: HistoricalAccessory) {
        selectedAccessory = accessory
    }
}
