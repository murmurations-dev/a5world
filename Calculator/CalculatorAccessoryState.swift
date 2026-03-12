//
//  CalculatorAccessoryState.swift
//  A5World
//
//  Created by Etienne Vautherin on 08/03/2026.
//

import Observation


@MainActor
@Observable
final class CalculatorAccessoryState {
    var display: String = "0"
    var eventLog: [String] = []
}

