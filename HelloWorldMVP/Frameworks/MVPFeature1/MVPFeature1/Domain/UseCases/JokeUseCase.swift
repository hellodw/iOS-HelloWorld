//
//  JokeUseCase.swift
//  MVPFeature1
//
//  Created by maverick.b on 2022/08/10.
//

import Foundation
import Combine

protocol JokeUseCase {
    func fetchRandomJoke() -> AnyPublisher<Joke, Error>
}

public final class DefaultJokeUseCase: JokeUseCase {
    private let jokeRepository: JokeRepository
    
    init(jokeRepository: JokeRepository) {
        self.jokeRepository = jokeRepository
    }
    
    func fetchRandomJoke() -> AnyPublisher<Joke, Error> {
        return jokeRepository.fetchRandomJoke()
    }
}
