//
//  LocaleDataSources.swift
//  InfoLeague
//
//  Created by Prima Jatnika on 22/11/23.
//

import Foundation
import RealmSwift
import RxSwift

protocol LocaleDataSourcesProtocol: AnyObject {
    
    func getLeagues() -> Observable<[LeaguesEntity]>
    
    func addLeagues(from leagues: [LeaguesEntity]) -> Observable<Bool>
}

class LocaleDataSources: NSObject {
    
    private let realm: Realm?
    
    private init(realm: Realm?) {
        self.realm = realm
    }
    
    static let sharedInstance: (Realm?) -> LocaleDataSources = {
        realmDatabase in return LocaleDataSources(realm: realmDatabase)
    }
}

extension LocaleDataSources: LocaleDataSourcesProtocol {
    func getLeagues() -> Observable<[LeaguesEntity]> {
        return Observable<[LeaguesEntity]>.create { observer in
            if let realm = self.realm {
                let leagues: Results<LeaguesEntity> = {
                    realm.objects(LeaguesEntity.self)
                        .sorted(byKeyPath: "name", ascending: true)
                }()
                
                observer.onNext(leagues.toArray(ofType: LeaguesEntity.self))
                observer.onCompleted()
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
    }
    
    func addLeagues(from leagues: [LeaguesEntity]) -> Observable<Bool> {
        return Observable<Bool>.create { observer in
            if let realm = self.realm {
                do {
                    try realm.write {
                        for league in leagues {
                            realm.add(league, update: .all)
                        }
                        observer.onNext(true)
                        observer.onCompleted()
                    }
                } catch {
                    observer.onError(DatabaseError.requestFailed)
                }
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            
            return Disposables.create()
        }
    }
    
}

extension Results {
  func toArray<T>(ofType: T.Type) -> [T] {
    var array = [T]()
    for index in 0 ..< count {
      if let result = self[index] as? T {
        array.append(result)
      }
    }
    return array
  }
}
