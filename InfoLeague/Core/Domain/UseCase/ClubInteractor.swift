//
//  ClubInteractor.swift
//  InfoLeague
//
//  Created by Prima Jatnika on 22/11/23.
//

import Foundation
import RxSwift

protocol ClubUseCase {
    func getClubByIdLeague(from id: String) -> Observable<[ClubModel]>
}

class ClubInteractor: ClubUseCase {
    
    private let repository: LeaguesRepositoryProtocol
    
    required init(repository: LeaguesRepositoryProtocol) {
        self.repository = repository
    }
    
    func getClubByIdLeague(from id: String) -> Observable<[ClubModel]> {
        return repository.getClubByIdLeague(from: id)
    }
}
