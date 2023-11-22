//
//  LeaguesModel.swift
//  InfoLeague
//
//  Created by Prima Jatnika on 19/11/23.
//

import Foundation
import UIKit

struct LeaguesModel: Equatable, Identifiable {
    let id: String
    let name: String
    let slug: String
    let abbr: String
    let logo: String
}
