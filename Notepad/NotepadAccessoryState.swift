//
//  NotepadAccessoryState.swift
//  A5World
//
//  Created by Etienne Vautherin on 08/03/2026.
//

import Observation


@MainActor
@Observable
final class NotepadAccessoryState {
    var localDraft: String = ""
    var eventLog: [String] = []
}

