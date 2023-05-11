//
//  JokeAPI.swift
//  MVPFeature1
//
//  Created by maverick.b on 2022/08/10.
//

import Foundation
import Moya

enum JokeAPI {
    case fetchRandomJoke
}

extension JokeAPI: Moya.TargetType {
    var baseURL: URL {
        switch self {
        case .fetchRandomJoke:
            return URL(string: "https://api.chucknorris.io")!
        }
    }
    
    var path: String {
        switch self {
        case .fetchRandomJoke:
            return "/jokes/random"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchRandomJoke:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .fetchRandomJoke:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        let headers = [String: String]()
        
        switch self {
        case .fetchRandomJoke:
            return headers
        }
    }
}
