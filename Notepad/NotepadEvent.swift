//
//  NotepadEvent.swift
//  A5World
//
//  Created by Etienne Vautherin on 08/03/2026.
//


enum NotepadEvent: Sendable {
    case paste(String)
    case clearClipboard
    case setDraft(String)
}

