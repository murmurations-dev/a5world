//
//  HistoricalAccessory.swift
//  A5World
//
//  Created by Etienne Vautherin on 08/03/2026.
//


import SwiftUI
import Observation
import Foundation

// MARK: - Historical accessories

enum HistoricalAccessory: String, CaseIterable, Identifiable, Hashable, Sendable {
    case calculator
    case controlPanel
    case notePad

    var id: String { rawValue }

    var title: String {
        switch self {
        case .calculator: return "Calculator"
        case .controlPanel: return "Control Panel"
        case .notePad: return "Notepad"
        }
    }

    var systemImage: String {
        switch self {
        case .calculator: return "plus.slash.minus"
        case .controlPanel: return "gearshape"
        case .notePad: return "square.and.pencil"
        }
    }
}
