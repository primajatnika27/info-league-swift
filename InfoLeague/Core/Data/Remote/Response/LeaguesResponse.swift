//
//  LeaguesResponse.swift
//  InfoLeague
//
//  Created by Prima Jatnika on 19/11/23.
//

import Foundation

struct LeaguesResponse: Decodable {
    let status: Bool
    let data: [LeaguesDataResponse]
}

struct LeaguesDataResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case slug = "slug"
        case abbr = "abbr"
        case logos = "logos"
    }
    
    let id: String?
    let name: String?
    let slug: String?
    let abbr: String?
    let logos: LogosResponse
}

struct LogosResponse: Decodable {
    let light: String?
    let dark: String?
}
