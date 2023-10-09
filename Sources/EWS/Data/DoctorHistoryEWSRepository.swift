    //
//  File.swift
//  
//
//  Created by Iqbal Nur Haq on 24/05/23.
//

import Foundation
import Core
import Combine


public struct DoctorHistoryEWSRepository<
    RemoteDataSource: DataSource,
    Transformer: Mapper> : Repository
where
RemoteDataSource.Request == Any,
RemoteDataSource.Response == [DoctorHistoryEWSDataResponse],
Transformer.Request == Any,
Transformer.Response == [DoctorHistoryEWSDataResponse],
Transformer.Entity == [DoctorHistoryEWSDataResponse],
Transformer.Domain == [DoctorHistoryEWSModel] {
    
    public typealias Request = Any
    public typealias Response = [DoctorHistoryEWSModel]
    
    private let _remoteDataSource: RemoteDataSource
    private let _mapper: Transformer
    
    public init(
        remoteDataSource: RemoteDataSource,
        mapper: Transformer
    ){
        _remoteDataSource = remoteDataSource
        _mapper = mapper
    }
    
    public func execute(request: Any?) -> AnyPublisher<[DoctorHistoryEWSModel], Error> {
        return _remoteDataSource.execute(request: request)
            .map { _mapper.transformResponseToDomain(request: request, response: $0) }
            .eraseToAnyPublisher()
        }
}
