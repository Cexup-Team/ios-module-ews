//
//  File.swift
//  
//
//  Created by Iqbal Nur Haq on 22/05/23.
//

import Foundation
import Core
import Combine


public struct DoctorListEWSRepository<
    RemoteDataSource: DataSource,
    Transformer: Mapper> : Repository
where
RemoteDataSource.Request == Any,
RemoteDataSource.Response == [DoctorListEWSDataResponse],
Transformer.Request == Any,
Transformer.Response == [DoctorListEWSDataResponse],
Transformer.Entity == [DoctorListEWSDataResponse],
Transformer.Domain == [DoctorListEWSModel] {
    
    public typealias Request = Any
    public typealias Response = [DoctorListEWSModel]
    
    private let _remoteDataSource: RemoteDataSource
    private let _mapper: Transformer
    
    public init(
        remoteDataSource: RemoteDataSource,
        mapper: Transformer
    ){
        _remoteDataSource = remoteDataSource
        _mapper = mapper
    }
    
    public func execute(request: Any?) -> AnyPublisher<[DoctorListEWSModel], Error> {
        return _remoteDataSource.execute(request: request)
            .map { _mapper.transformResponseToDomain(request: request, response: $0) }
            .eraseToAnyPublisher()
        }
}
    




