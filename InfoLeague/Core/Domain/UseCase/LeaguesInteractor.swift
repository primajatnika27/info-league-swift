//
//  LeaguesInteractor.swift
//  InfoLeague
//
//  Created by Prima Jatnika on 19/11/23.
//

import Foundation
import RxSwift

protocol LeaguesUseCase {
    func getLeagues() -> Observable<[LeaguesModel]>
}

class LeaguesInteractor: LeaguesUseCase {
    
    private let repository: LeaguesRepositoryProtocol
    
    required init(repository: LeaguesRepositoryProtocol) {
        self.repository = repository
    }
    
    func getLeagues() -> Observable<[LeaguesModel]> {
        return repository.getLeagues()
    }
}
