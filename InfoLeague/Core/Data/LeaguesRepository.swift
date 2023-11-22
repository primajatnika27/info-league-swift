//
//  LeaguesRepository.swift
//  InfoLeague
//
//  Created by Prima Jatnika on 19/11/23.
//

import Foundation
import RxSwift

protocol LeaguesRepositoryProtocol {
    func getLeagues() -> Observable<[LeaguesModel]>
    func getClubByIdLeague(from id: String) -> Observable<[ClubModel]>
}

final class LeaguesRepository: NSObject {
    
    typealias LeaguesInstance = (RemoteDataSource, LocaleDataSources) -> LeaguesRepository
    
    fileprivate let remote: RemoteDataSource
    fileprivate let locale: LocaleDataSources
    
    init(remote: RemoteDataSource, locale: LocaleDataSources) {
        self.remote = remote
        self.locale = locale
    }
    
    static let sharedInstance: LeaguesInstance = { remoteRepo, localeRepo in
        return LeaguesRepository(remote: remoteRepo, locale: localeRepo)
    }
}

extension LeaguesRepository: LeaguesRepositoryProtocol {
    
    func getClubByIdLeague(from id: String) -> Observable<[ClubModel]> {
        return self.remote.getClubByIdLeague(from: id)
            .map {
                ClubMapper.mapClubResponseToDomain(input: $0.data.standings)
            }
    }
    
    
    func getLeagues() -> Observable<[LeaguesModel]> {
        
        return self.locale.getLeagues()
            .map {
                LeaguesMapper.mapLeaguesEntityToDomains(input: $0)
            }
            .filter {
                !$0.isEmpty
            }
            .ifEmpty(switchTo: self.remote.getLeagues()
                .map {
                    LeaguesMapper.mapLeaguesResponseToEntity(input: $0.data)
                }
                .flatMap{
                    self.locale.addLeagues(from: $0)
                }
                .filter {
                    $0
                }
                .flatMap{ _ in self.locale.getLeagues()
                        .map {
                            LeaguesMapper.mapLeaguesEntityToDomains(input: $0)
                        }
                }
            )
    }
}
