//
//  DeskAccessoryRuntime.swift
//  A5World
//
//  Created by Etienne Vautherin on 08/03/2026.
//

import Observation


// MARK: - Root runtime container

@MainActor
@Observable
final class DeskAccessoryRuntime {
    let appModel: AppModel

    let calculatorChannel: AccessoryEventChannel<CalculatorEvent>
    let controlPanelChannel: AccessoryEventChannel<ControlPanelEvent>
    let NotepadChannel: AccessoryEventChannel<NotepadEvent>

    let calculatorState: CalculatorAccessoryState
    let controlPanelState: ControlPanelAccessoryState
    let NotepadState: NotepadAccessoryState

    private var tasks: [Task<Void, Never>] = []

    init(appModel: AppModel? = nil) {
        self.appModel = appModel ?? AppModel()

        self.calculatorChannel = AccessoryEventChannel<CalculatorEvent>()
        self.controlPanelChannel = AccessoryEventChannel<ControlPanelEvent>()
        self.NotepadChannel = AccessoryEventChannel<NotepadEvent>()

        self.calculatorState = CalculatorAccessoryState()
        self.controlPanelState = ControlPanelAccessoryState()
        self.NotepadState = NotepadAccessoryState()
    }

    func start() {
        guard tasks.isEmpty else { return }

        tasks.append(Task {
            await runCalculatorAccessory(
                channel: calculatorChannel,
                state: calculatorState
            )
        })

        tasks.append(Task {
            await runControlPanelAccessory(
                channel: controlPanelChannel,
                state: controlPanelState,
                appModel: appModel
            )
        })

        tasks.append(Task {
            await runNotepadAccessory(
                channel: NotepadChannel,
                state: NotepadState,
                appModel: appModel
            )
        })
    }

    func stop() {
        calculatorChannel.finish()
        controlPanelChannel.finish()
        NotepadChannel.finish()

        tasks.forEach { $0.cancel() }
        tasks.removeAll()
    }
}

