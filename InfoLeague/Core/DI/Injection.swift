//
//  Injection.swift
//  InfoLeague
//
//  Created by Prima Jatnika on 19/11/23.
//

import Foundation
import RealmSwift

final class Injection: NSObject {
    
    private func provideRepository() -> LeaguesRepositoryProtocol {
        let realm = try? Realm()
        
        let locale: LocaleDataSources = LocaleDataSources.sharedInstance(realm)
        let remote: RemoteDataSource = RemoteDataSource.sharedInstance
        
        return LeaguesRepository(remote: remote, locale: locale)
    }
    
    func provideLeagues() -> LeaguesUseCase {
        let repository = provideRepository()
        
        return LeaguesInteractor(repository: repository)
    }
    
    func provideClub() -> ClubUseCase {
        let repository = provideRepository()
        
        return ClubInteractor(repository: repository)
    }
}
