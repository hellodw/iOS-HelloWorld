//
//  AnyPublisher+.swift
//  MVPCore
//
//  Created by maverick.b on 2022/08/10.
//

import Foundation
import Combine
import Moya

public extension AnyPublisher where Output == Response, Failure == MoyaError {

    /// Filters out responses that don't fall within the given range, generating errors when others are encountered.
    func filter<R: RangeExpression>(statusCodes: R) -> AnyPublisher<Response, MoyaError> where R.Bound == Int {
        return unwrapThrowable { response in
            try response.filter(statusCodes: statusCodes)
        }
    }

    /// Filters out responses that has the specified `statusCode`.
    func filter(statusCode: Int) -> AnyPublisher<Response, MoyaError> {
        return unwrapThrowable { response in
            try response.filter(statusCode: statusCode)
        }
    }

    /// Filters out responses where `statusCode` falls within the range 200 - 299.
    func filterSuccessfulStatusCodes() -> AnyPublisher<Response, MoyaError> {
        return unwrapThrowable { response in
            try response.filterSuccessfulStatusCodes()
        }
    }

    /// Filters out responses where `statusCode` falls within the range 200 - 399
    func filterSuccessfulStatusAndRedirectCodes() -> AnyPublisher<Response, MoyaError> {
        return unwrapThrowable { response in
            try response.filterSuccessfulStatusAndRedirectCodes()
        }
    }

    /// Maps data received from the signal into an Image. If the conversion fails, the signal errors.
    func mapImage() -> AnyPublisher<Image, MoyaError> {
        return unwrapThrowable { response in
            try response.mapImage()
        }
    }

    /// Maps data received from the signal into a JSON object. If the conversion fails, the signal errors.
    func mapJSON(failsOnEmptyData: Bool = true) -> AnyPublisher<Any, MoyaError> {
        return unwrapThrowable { response in
            try response.mapJSON(failsOnEmptyData: failsOnEmptyData)
        }
    }

    /// Maps received data at key path into a String. If the conversion fails, the signal errors.
    func mapString(atKeyPath keyPath: String? = nil) -> AnyPublisher<String, MoyaError> {
        return unwrapThrowable { response in
            try response.mapString(atKeyPath: keyPath)
        }
    }

    /// Maps received data at key path into a Decodable object. If the conversion fails, the signal errors.
    func map<D: Decodable>(_ type: D.Type, atKeyPath keyPath: String? = nil, using decoder: JSONDecoder = JSONDecoder(), failsOnEmptyData: Bool = true) -> AnyPublisher<D, MoyaError> {
        return unwrapThrowable { response in
            try response.map(type, atKeyPath: keyPath, using: decoder, failsOnEmptyData: failsOnEmptyData)
        }
    }
}

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public extension AnyPublisher where Output == ProgressResponse, Failure == MoyaError {

    /**
     Filter completed progress response and maps to actual response
     - returns: response associated with ProgressResponse object
     */
    func filterCompleted() -> AnyPublisher<Response, MoyaError> {
        return self
            .compactMap { $0.response }
            .eraseToAnyPublisher()
    }

    /**
     Filter progress events of current ProgressResponse
     - returns: observable of progress events
     */
    func filterProgress() -> AnyPublisher<Double, MoyaError> {
        return self
            .filter { !$0.completed }
            .map { $0.progress }
            .eraseToAnyPublisher()
    }
}

extension AnyPublisher where Failure == MoyaError {

    // Workaround for a lot of things, actually. We don't have Publishers.Once, flatMap
    // that can throw and a lot more. So this monster was created because of that. Sorry.
    private func unwrapThrowable<T>(throwable: @escaping (Output) throws -> T) -> AnyPublisher<T, MoyaError> {
        self.tryMap { element in
            try throwable(element)
        }
        .mapError { error -> MoyaError in
            if let moyaError = error as? MoyaError {
                return moyaError
            } else {
                return .underlying(error, nil)
            }
        }
        .eraseToAnyPublisher()
    }
}
