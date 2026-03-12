//
//  ControlPanelAccessoryState.swift
//  A5World
//
//  Created by Etienne Vautherin on 08/03/2026.
//

import Observation


@MainActor
@Observable
final class ControlPanelAccessoryState {
    var availableColors: [String] = ["Blue", "Green", "Orange", "Purple"]
    var eventLog: [String] = []
}

