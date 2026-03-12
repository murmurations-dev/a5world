//
//  ControlPanelAccessoryView.swift
//  A5World
//
//  Created by Etienne Vautherin on 08/03/2026.
//

import SwiftUI


// MARK: - Control Panel view

struct ControlPanelAccessoryView: View {
    @Bindable var runtime: DeskAccessoryRuntime

    var body: some View {
        NavigationStack {
            Form {
                Section("Shared A5 World") {
                    Text("App: \(runtime.appModel.sharedGlobals.appName)")
                    Text("Clipboard: \(runtime.appModel.sharedGlobals.clipboardText)")
                }

                Section("System Settings") {
                    Toggle(
                        "System Sound",
                        isOn: Binding(
                            get: { runtime.appModel.sharedGlobals.soundEnabled },
                            set: { runtime.controlPanelChannel.post(.setSound($0)) }
                        )
                    )

                    Picker(
                        "Accent Color",
                        selection: Binding(
                            get: { runtime.appModel.sharedGlobals.accentColorName },
                            set: { runtime.controlPanelChannel.post(.setAccentColor($0)) }
                        )
                    ) {
                        ForEach(runtime.controlPanelState.availableColors, id: \.self) { color in
                            Text(color).tag(color)
                        }
                    }
                }

                Section("Control Panel stream log") {
                    ForEach(Array(runtime.controlPanelState.eventLog.enumerated()), id: \.offset) { _, line in
                        Text(line)
                            .font(.system(.caption, design: .monospaced))
                    }
                }
            }
            .navigationTitle("Control Panel")
        }
    }
}
