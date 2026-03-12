//
//  NotepadAccessoryView.swift
//  A5World
//
//  Created by Etienne Vautherin on 08/03/2026.
//

import SwiftUI


// MARK: - Notepad view

struct NotepadAccessoryView: View {
    @Bindable var runtime: DeskAccessoryRuntime

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text("Notepad")
                    .font(.title.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)

                SharedHeaderView(
                    appName: runtime.appModel.sharedGlobals.appName,
                    accentColorName: runtime.appModel.sharedGlobals.accentColorName,
                    soundEnabled: runtime.appModel.sharedGlobals.soundEnabled,
                    clipboardText: runtime.appModel.sharedGlobals.clipboardText
                )

                VStack(alignment: .leading, spacing: 8) {
                    Text("Shared clipboard in A5 World")
                        .font(.headline)

                    TextEditor(
                        text: Binding(
                            get: { runtime.appModel.sharedGlobals.clipboardText },
                            set: { runtime.NotepadChannel.post(.paste($0)) }
                        )
                    )
                    .frame(height: 120)
                    .padding(8)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                    Button("Clear Clipboard") {
                        runtime.NotepadChannel.post(.clearClipboard)
                    }
                    .buttonStyle(.bordered)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Local Notepad draft")
                        .font(.headline)

                    TextEditor(
                        text: Binding(
                            get: { runtime.NotepadState.localDraft },
                            set: { runtime.NotepadChannel.post(.setDraft($0)) }
                        )
                    )
                    .frame(height: 120)
                    .padding(8)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }

                eventLog(title: "Notepad stream log", lines: runtime.NotepadState.eventLog)

                Spacer()
            }
            .padding()
        }
    }
}
