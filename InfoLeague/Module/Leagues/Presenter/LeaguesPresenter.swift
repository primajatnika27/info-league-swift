//
//  LeaguesPresenter.swift
//  InfoLeague
//
//  Created by Prima Jatnika on 19/11/23.
//

import Foundation
import RxSwift

protocol LeaguesPresenterProtocol {
    func getLeagues() -> Observable<[LeaguesModel]>
}

class LeaguesPresenter: LeaguesPresenterProtocol {
    
    private let leaguesUseCase: LeaguesUseCase
    
    init(usecase: LeaguesUseCase) {
        self.leaguesUseCase = usecase
    }
    
    func getLeagues() -> Observable<[LeaguesModel]> {
        leaguesUseCase.getLeagues()
    }
}
