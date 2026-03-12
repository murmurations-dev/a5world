//
//  HistoricalDeskAccessoriesView.swift
//  A5World
//
//  Created by Etienne Vautherin on 08/03/2026.
//

import SwiftUI


// MARK: - Root view

struct HistoricalDeskAccessoriesView: View {
    @State private var runtime = DeskAccessoryRuntime()

    var body: some View {
        TabView(
            selection: Binding(
                get: { runtime.appModel.selectedAccessory },
                set: { runtime.appModel.selectAccessory($0) }
            )
        ) {
            CalculatorAccessoryView(runtime: runtime)
                .tabItem {
                    Label(HistoricalAccessory.calculator.title, systemImage: HistoricalAccessory.calculator.systemImage)
                }
                .tag(HistoricalAccessory.calculator)

            ControlPanelAccessoryView(runtime: runtime)
                .tabItem {
                    Label(HistoricalAccessory.controlPanel.title, systemImage: HistoricalAccessory.controlPanel.systemImage)
                }
                .tag(HistoricalAccessory.controlPanel)

            NotepadAccessoryView(runtime: runtime)
                .tabItem {
                    Label(HistoricalAccessory.notePad.title, systemImage: HistoricalAccessory.notePad.systemImage)
                }
                .tag(HistoricalAccessory.notePad)
        }
        .task {
            runtime.start()
            await runtime.appModel.refresh()
        }
        .onDisappear {
            runtime.stop()
        }
    }
}

// MARK: - Preview

#Preview {
    HistoricalDeskAccessoriesView()
}
