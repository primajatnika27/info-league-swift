//
//  LeaguesMapper.swift
//  InfoLeague
//
//  Created by Prima Jatnika on 19/11/23.
//

import Foundation
import UIKit

final class LeaguesMapper {
    static func mapLeaguesEntityToDomains(
        input response: [LeaguesEntity]
    ) -> [LeaguesModel] {
        return response.map { result in
            return LeaguesModel(id: result.id, name: result.name, slug: result.slug, abbr: result.abbr, logo: result.logo)
        }
    }
    
    static func mapLeaguesResponseToEntity(
        input response: [LeaguesDataResponse]
    ) -> [LeaguesEntity] {
        return response.map { result in
            let newLeague = LeaguesEntity()
            newLeague.id = result.id ?? ""
            newLeague.name = result.name ?? ""
            newLeague.slug = result.slug ?? ""
            newLeague.abbr = result.abbr ?? ""
            newLeague.logo = result.logos.light ?? ""
            
            return newLeague
        }
    }
}
