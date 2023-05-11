//
//  DefaultJokeRepository.swift
//  MVPFeature1
//
//  Created by maverick.b on 2022/08/10.
//

import Foundation
import MVPCore
import Combine

final class DefaultJokeRepository {
    private let feature1Network: MVPFeature1Network
    private var subscriptions = Set<AnyCancellable>()
    
    init(feature1Network: MVPFeature1Network) {
        self.feature1Network = feature1Network
    }
}

extension DefaultJokeRepository: JokeRepository {
    func fetchRandomJoke() -> AnyPublisher<Joke, Error> {
        let requestPublisher: AnyPublisher<JokeResponseDTO, Error> = self.feature1Network.mappedRequest(.fetchRandomJoke)
        
        return requestPublisher.map { responseDTO in
            responseDTO.convertToDomain()
        }
        .eraseToAnyPublisher()
    }
}
