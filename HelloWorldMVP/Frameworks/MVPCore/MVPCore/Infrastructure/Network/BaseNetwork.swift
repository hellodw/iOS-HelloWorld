//
//  BaseNetwork.swift
//  HelloWorld
//
//  Created by maverick.b on 2022/07/14.
//

import Combine
import Moya

public protocol BaseNetwork {
  associatedtype Target: Moya.TargetType
  var provider: MoyaProvider<Target> { get }
}

public extension BaseNetwork {
  func request(_ target: Target) -> AnyPublisher<Response, MoyaError> {
      return provider
          .requestPublisher(target, callbackQueue: DispatchQueue.global())
          .filterSuccessfulStatusCodes()
  }
  
  func requestWithProgress(_ target: Target) -> AnyPublisher<ProgressResponse, MoyaError> {
    provider.requestWithProgressPublisher(target)
  }
  
  func mappedRequest<D: Decodable>(_ target: Target) -> AnyPublisher<D, Error> {
      return provider
          .requestPublisher(target, callbackQueue: DispatchQueue.global())
          .filterSuccessfulStatusCodes()
          .map(D.self)
          .tryMap { $0 }
          .receive(on: DispatchQueue.main)
          .eraseToAnyPublisher()
  }
  
//  func dictionaryRequest(_ target: Target) -> AnyPublisher<[String: Any], Error> {
//    return
//    provider
//      .requestPublisher(target, callbackQueue: DispatchQueue.global())
//      .filterSuccessfulStatusCodes()
//      .mapJSON()
//      .tryMap { result -> [String: Any] in
//        guard let resultDic = result as? [String: Any] else {
//          throw VliveAPIError.unknowException
//        }
//        return resultDic
//      }
//      .receive(on: DispatchQueue.main)
//      .eraseToAnyPublisher()
//  }
}


/**
 async await 지원 method
 */
extension BaseNetwork {

  @discardableResult
  func requestAsync(_ target:Target) async throws -> Response {
    try await withCheckedThrowingContinuation { continuation in
      provider.request(target) { result in
        switch result {
        case let .success(response):
          do {
            let res = try response.filterSuccessfulStatusCodes()
            continuation.resume(returning:res)
          } catch {
            continuation.resume(throwing: error)
          }
        case let .failure(moyaError):
          continuation.resume(throwing: moyaError)
        }
      }
    }
  }

  @discardableResult
  func mappedRequestAsync<D:Decodable>(_ target:Target) async throws -> D {
    try await withCheckedThrowingContinuation { continuation in
      provider.request(target) { result in
        switch result {
        case let .success(response):
          do {
            let _ = try response.filterSuccessfulStatusCodes()
            let res = try response.map(D.self)
            continuation.resume(returning: res)
          } catch {
            continuation.resume(throwing: error)
          }
        case let .failure(moyaError):
          continuation.resume(throwing: moyaError)
        }
      }
    }
  }
}
