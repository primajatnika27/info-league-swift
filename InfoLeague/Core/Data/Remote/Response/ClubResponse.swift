//
//  ClubResponse.swift
//  InfoLeague
//
//  Created by Prima Jatnika on 20/11/23.
//

import Foundation

struct ClubRespose: Decodable {
    let status: Bool
    let data: ClubDataResponse
}

struct ClubDataResponse: Decodable {
    let name: String
    let season: Int
    let standings: [DataStandingsResponse]
}

struct DataStandingsResponse: Decodable {
    let team: ClubTeamResponse
}

struct ClubTeamResponse: Decodable {
    let id: String
    let name: String
    let logos: [ClubLogosResponse]
}

struct ClubLogosResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case image = "href"
    }
    
    let image: String
}
