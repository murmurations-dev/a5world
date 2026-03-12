//
//  CalculatorAccessoryView.swift
//  A5World
//
//  Created by Etienne Vautherin on 08/03/2026.
//

import SwiftUI


// MARK: - Calculator view

struct CalculatorAccessoryView: View {
    @Bindable var runtime: DeskAccessoryRuntime

    private let rows: [[String]] = [
        ["7", "8", "9"],
        ["4", "5", "6"],
        ["1", "2", "3"],
        ["C", "0", "+"]
    ]

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                SharedHeaderView(
                    appName: runtime.appModel.sharedGlobals.appName,
                    accentColorName: runtime.appModel.sharedGlobals.accentColorName,
                    soundEnabled: runtime.appModel.sharedGlobals.soundEnabled,
                    clipboardText: runtime.appModel.sharedGlobals.clipboardText
                )

                Text(runtime.calculatorState.display)
                    .font(.largeTitle.monospacedDigit())
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding()
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                ForEach(rows, id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { symbol in
                            Button(symbol) {
                                handle(symbol)
                            }
                            .buttonStyle(.borderedProminent)
                            .frame(maxWidth: .infinity)
                        }
                    }
                }

                eventLog(title: "Calculator stream log", lines: runtime.calculatorState.eventLog)

                Spacer()
            }
            .padding()
            .navigationTitle("Calculator")
        }
    }

    private func handle(_ symbol: String) {
        switch symbol {
        case "C":
            runtime.calculatorChannel.post(.clear)
        default:
            runtime.calculatorChannel.post(.digit(symbol))
        }
    }
}

