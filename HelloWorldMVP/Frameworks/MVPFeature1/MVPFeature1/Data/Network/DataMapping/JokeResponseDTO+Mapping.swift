//
//  JokeResponseDTO+Mapping.swift
//  MVPFeature1
//
//  Created by maverick.b on 2022/08/11.
//

import Foundation

struct JokeResponseDTO: Decodable {
    private enum CodingKeys: String, CodingKey {
        case categories
        case createdAt = "created_at"
        case iconURL = "icon_url"
        case id
        case updatedAt = "updated_at"
        case siteURL = "url"
        case value
    }
    
    let categories: [String]
    let createdAt: String
    let iconURL: URL
    let id: String
    let updatedAt: String
    let siteURL: URL
    let value: String
}

extension JokeResponseDTO {
    func convertToDomain() -> Joke {
        return .init(categories: categories,
                     createdAt: createdAt.convertToDate(type: .type1),
                     iconURL: iconURL,
                     id: id,
                     updatedAt: updatedAt.convertToDate(type: .type1),
                     siteURL: siteURL,
                     value: value
        )
    }
}
