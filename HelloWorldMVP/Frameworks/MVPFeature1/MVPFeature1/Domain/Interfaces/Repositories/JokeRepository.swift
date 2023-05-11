//
//  JokeRepository.swift
//  MVPFeature1
//
//  Created by maverick.b on 2022/08/10.
//

import Foundation
import Combine

protocol JokeRepository {
    func fetchRandomJoke() -> AnyPublisher<Joke, Error>
}
