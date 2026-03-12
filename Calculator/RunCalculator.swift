//
//  RunCalculator.swift
//  A5World
//
//  Created by Etienne Vautherin on 08/03/2026.
//


@MainActor
func runCalculatorAccessory(
    channel: AccessoryEventChannel<CalculatorEvent>,
    state: CalculatorAccessoryState
) async {
    for await event in channel.stream {
        switch event {
        case .digit(let value):
            if state.display == "0" {
                state.display = value
            } else {
                state.display += value
            }
            state.eventLog.append("digit(\(value))")

        case .clear:
            state.display = "0"
            state.eventLog.append("clear")
        }
    }
}

