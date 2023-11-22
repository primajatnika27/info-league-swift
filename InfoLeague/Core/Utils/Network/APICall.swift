//
//  APICall.swift
//  InfoLeague
//
//  Created by Prima Jatnika on 19/11/23.
//

import Foundation

struct API {
    static let baseUrl = "https://api-football-standings.azharimm.dev/"
}

protocol Endpoint {
    var url: String { get }
}

enum Endpoints {
    enum Gets: Endpoint {
        case league
        
        public var url: String {
            switch self {
            case .league: return "\(API.baseUrl)leagues"
            }
        }
    }
}
