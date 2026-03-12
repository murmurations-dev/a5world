//
//  EventLog.swift
//  A5World
//
//  Created by Etienne Vautherin on 08/03/2026.
//

import SwiftUI


@ViewBuilder
func eventLog(title: String, lines: [String]) -> some View {
    EventLogView(title: title, lines: lines)
}
