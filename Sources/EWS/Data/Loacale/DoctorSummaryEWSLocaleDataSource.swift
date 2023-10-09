//
//  File.swift
//  
//
//  Created by Iqbal Nur Haq on 13/01/23.
//

import Foundation
import Core
import Combine
import RealmSwift

public struct DoctorSummaryEWSLocaleDataSource: LocaleDataSource {
    
    public typealias Request = Any
    public typealias Response = DoctorSummaryEWSEntity
    
    private let _realm: Realm
    
    public init(realm: Realm){
        _realm = realm
    }
    
    public func list(request: Any?) -> AnyPublisher<[DoctorSummaryEWSEntity], Error> {
        fatalError()
    }
    
    public func add(entities: [DoctorSummaryEWSEntity]) -> AnyPublisher<Bool, Error> {
        fatalError()
    }
    
    public func get(id: String?) -> AnyPublisher<DoctorSummaryEWSEntity, Error> {
        return Future<DoctorSummaryEWSEntity, Error> { completion in
            let summary: Results<DoctorSummaryEWSEntity> = {
                _realm.objects(DoctorSummaryEWSEntity.self)
            }()
            
            completion(.success(summary.first ?? DoctorSummaryEWSEntity()))
            
        }.eraseToAnyPublisher()
    }
    
    public func addOne(entity: DoctorSummaryEWSEntity) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            do {
                try _realm.write {
                    _realm.add(entity, update: .all)
                    completion(.success(true))
                }
            }catch {
                completion(.failure(DataBaseError.requestFailed))
            }
        }.eraseToAnyPublisher()
    }
    
    public func update(id: Int, entity: DoctorSummaryEWSEntity) -> AnyPublisher<Bool, Error> {
        fatalError()
    }
}



