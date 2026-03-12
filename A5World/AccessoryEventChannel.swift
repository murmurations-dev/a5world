//
//  AccessoryEventChannel.swift
//  A5World
//
//  Created by Etienne Vautherin on 08/03/2026.
//


// MARK: - MainActor event channel using AsyncStream.makeStream

@MainActor
final class AccessoryEventChannel<Event: Sendable> {
    let stream: AsyncStream<Event>
    private let continuation: AsyncStream<Event>.Continuation

    init() {
        let (stream, continuation) = AsyncStream.makeStream(of: Event.self)
        self.stream = stream
        self.continuation = continuation
    }

    func post(_ event: Event) {
        continuation.yield(event)
    }

    func finish() {
        continuation.finish()
    }
}
