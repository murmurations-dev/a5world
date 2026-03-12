//
//  RunControlPanel.swift
//  A5World
//
//  Created by Etienne Vautherin on 08/03/2026.
//


@MainActor
func runControlPanelAccessory(
    channel: AccessoryEventChannel<ControlPanelEvent>,
    state: ControlPanelAccessoryState,
    appModel: AppModel
) async {
    for await event in channel.stream {
        switch event {
        case .setSound(let enabled):
            await appModel.a5World.setSoundEnabled(enabled)
            await appModel.refresh()
            state.eventLog.append("setSound(\(enabled))")

        case .setAccentColor(let color):
            await appModel.a5World.setAccentColorName(color)
            await appModel.refresh()
            state.eventLog.append("setAccentColor(\(color))")
        }
    }
}

