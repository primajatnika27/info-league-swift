//
//  RemoteDataSources.swift
//  InfoLeague
//
//  Created by Prima Jatnika on 19/11/23.
//

import Foundation
import Alamofire
import RxSwift

protocol RemoteDataSourceProtocol: AnyObject {
    func getLeagues() -> Observable<LeaguesResponse>
    func getClubByIdLeague(from id: String) -> Observable<ClubRespose>
}

final class RemoteDataSource: NSObject {
    private override init() { }
    
    static let sharedInstance: RemoteDataSource = RemoteDataSource()
}

extension RemoteDataSource: RemoteDataSourceProtocol {
    func getClubByIdLeague(from id: String) -> Observable<ClubRespose> {
        
        let params: Parameters = [
            "season": "2023",
            "sort": "asc"
        ]
        
        return Observable<ClubRespose>.create { observer in
            if let url = URL(string: Endpoints.Gets.league.url + "/\(id)/standings") {
                AF.request(url, parameters: params)
                    .validate()
                    .responseDecodable(of: ClubRespose.self) { response in
                        switch response.result {
                        case .success(let value):
                            observer.onNext(value)
                            observer.onCompleted()
                        case .failure:
                            observer.onError(URLError.invalidResponse)
                        }
                }
            }
            return Disposables.create()
        }
    }
    
    func getLeagues() -> Observable<LeaguesResponse> {
        
        return Observable<LeaguesResponse>.create { observer in
            if let url = URL(string: Endpoints.Gets.league.url) {
                AF.request(url).validate().responseDecodable(of: LeaguesResponse.self) { response in
                    switch response.result {
                    case .success(let value):
                        observer.onNext(value)
                        observer.onCompleted()
                    case .failure:
                        observer.onError(URLError.invalidResponse)
                    }
                }
            }
            return Disposables.create()
        }
    }
}
