//
//  JokeUseCaseTests.swift
//  HelloWorldMVPTests
//
//  Created by maverick.b on 2022/08/10.
//

import XCTest
import Combine
@testable import MVPFeature1

class JokeUseCaseTests: XCTestCase {
    private var sut: JokeUseCase!
    private var subscriptions: Set<AnyCancellable>!
    
    override func setUp() {
        let network = MVPFeature1Network.shared
        let jokeRepository = DefaultJokeRepository(feature1Network: network)
        sut = DefaultJokeUseCase(jokeRepository: jokeRepository)
        subscriptions = []
    }
    
    func testJokeUseCase_whenFetchRandomJoke_thenSuccessAndNotEmpty() {
        // given
        let expectation = self.expectation(description: "fetchRandomJoke")
        var error: Error?
        var result: Joke?
        
        // when
        sut.fetchRandomJoke()
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let _error):
                    error = _error
                }
                expectation.fulfill()
            } receiveValue: { joke in
                print("joke: \(joke)")
                result = joke
            }
            .store(in: &subscriptions)
        
        waitForExpectations(timeout: 10)
        
        // then
        XCTAssertNil(error)
        XCTAssertTrue(result != nil)
    }
}
