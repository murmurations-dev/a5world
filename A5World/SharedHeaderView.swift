//
//  SharedIslandHeaderView.swift
//  A5World
//
//  Created by Etienne Vautherin on 08/03/2026.
//

import SwiftUI

// MARK: - Shared island header

struct SharedHeaderView: View {
    let appName: String
    let accentColorName: String
    let soundEnabled: Bool
    let clipboardText: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(appName)
                .font(.title3.bold())

            Text("Accent: \(accentColorName)")
            Text("Sound: \(soundEnabled ? "On" : "Off")")
            Text("Clipboard: \(clipboardText.isEmpty ? "∅" : clipboardText)")
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
