//
//  MoyaPublisher.swift
//  HelloWorld
//
//  Created by maverick.b on 2022/07/14.
//

import Combine
import Moya

internal class MoyaPublisher<Output>: Publisher {

    internal typealias Failure = MoyaError

    private class MoyaSubscription: Subscription {

            private let cancellable: Moya.Cancellable?

            init(subscriber: AnySubscriber<Output, MoyaError>, callback: @escaping (AnySubscriber<Output, MoyaError>) -> Moya.Cancellable?) {
            self.cancellable = callback(subscriber)
        }

        func request(_ demand: Subscribers.Demand) {
            // We don't care for the demand right now
        }

        func cancel() {
            cancellable?.cancel()
        }
    }

        private let callback: (AnySubscriber<Output, MoyaError>) -> Moya.Cancellable?

    init(callback: @escaping (AnySubscriber<Output, MoyaError>) -> Moya.Cancellable?) {
        self.callback = callback
    }

    internal func receive<S>(subscriber: S) where S: Subscriber, Failure == S.Failure, Output == S.Input {
        let subscription = MoyaSubscription(subscriber: AnySubscriber(subscriber), callback: callback)
        subscriber.receive(subscription: subscription)
    }
}
