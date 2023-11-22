//
//  LeaguesEntity.swift
//  InfoLeague
//
//  Created by Prima Jatnika on 22/11/23.
//

import Foundation
import RealmSwift

class LeaguesEntity: Object {
    
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var slug: String = ""
    @objc dynamic var abbr: String = ""
    @objc dynamic var logo: String = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
