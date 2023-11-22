//
//  ClubPresenter.swift
//  InfoLeague
//
//  Created by Prima Jatnika on 22/11/23.
//

import Foundation
import RxSwift

protocol ClubPresenterProtocol {
    func getClubByIdLeague(from id: String) -> Observable<[ClubModel]>
}

class ClubPresenter: ClubPresenterProtocol {
    
    private let clubUseCase: ClubUseCase
    
    init(usecase: ClubUseCase) {
        self.clubUseCase = usecase
    }
    
    func getClubByIdLeague(from id: String) -> Observable<[ClubModel]> {
        return  clubUseCase.getClubByIdLeague(from: id)
    }
}
