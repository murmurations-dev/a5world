//
//  RunNotepad.swift
//  A5World
//
//  Created by Etienne Vautherin on 08/03/2026.
//


@MainActor
func runNotepadAccessory(
    channel: AccessoryEventChannel<NotepadEvent>,
    state: NotepadAccessoryState,
    appModel: AppModel
) async {
    for await event in channel.stream {
        switch event {
        case .paste(let text):
            await appModel.a5World.setClipboardText(text)
            await appModel.refresh()
            state.eventLog.append("paste(\(text))")

        case .clearClipboard:
            await appModel.a5World.setClipboardText("")
            await appModel.refresh()
            state.eventLog.append("clearClipboard")

        case .setDraft(let text):
            state.localDraft = text
            state.eventLog.append("setDraft(\(text))")
        }
    }
}

