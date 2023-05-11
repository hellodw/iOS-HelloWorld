//
//  RandomJokeUseCaseTests.swift
//  HelloWorldTests
//
//  Created by maverick.b on 2022/07/14.
//

import XCTest
@testable import HelloWorld

class RandomJokeUseCaseTest: XCTestCase {
    var sut: RandomJokeUseCase!
    
    
    override func setUp() {
        let network = HelloWorldNetwork.shared
        let jokeRepository = DefaultJokeRepository(network: network)
        sut = RandomJokeUseCase(jokeRepositroy: jokeRepository)
    }
    
    func testGogogo() async throws {
        // given
        let joke = try await sut.excute(firstName: "", lastName: "")
        
        // when
        
        // then
    }
}
