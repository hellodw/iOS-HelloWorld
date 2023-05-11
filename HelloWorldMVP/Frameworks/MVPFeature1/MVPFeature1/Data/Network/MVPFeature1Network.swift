//
//  MVPFeature1Network.swift
//  MVPFeature1
//
//  Created by maverick.b on 2022/08/10.
//

import Foundation
import MVPCore
import Moya

final class MVPFeature1Network: BaseNetwork {
    static let shared = MVPFeature1Network()
    
    typealias Target = JokeAPI
    let provider: MoyaProvider<Target> = {
        let session = MoyaProvider<Target>.defaultAlamofireSession()
        session.sessionConfiguration.tlsMinimumSupportedProtocolVersion = .TLSv10
        session.sessionConfiguration.tlsMaximumSupportedProtocolVersion = .TLSv13
        session.sessionConfiguration.timeoutIntervalForRequest = 10
        session.sessionConfiguration.timeoutIntervalForResource = 10
        return MoyaProvider<Target>(session: session)
    }()
    
    private init() {}
}
