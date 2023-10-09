//
//  File.swift
//  
//
//  Created by Iqbal Nur Haq on 13/01/23.
//

import Foundation
import Core
import Combine


public struct DoctorSummaryEWRepository<
    DoctorSummaryEWSLocaleDataSource: LocaleDataSource,
    RemoteDataSource: DataSource,
    Transformer: Mapper> : Repository
where
DoctorSummaryEWSLocaleDataSource.Request == Any,
DoctorSummaryEWSLocaleDataSource.Response == DoctorSummaryEWSEntity,
RemoteDataSource.Request == Any,
RemoteDataSource.Response == DoctorSummaryEWSDataResponse,
Transformer.Request == Any,
Transformer.Response == DoctorSummaryEWSDataResponse,
Transformer.Entity == DoctorSummaryEWSEntity,
Transformer.Domain == DoctorSummaryEWSModel {
    
    public typealias Request = Any
    public typealias Response = DoctorSummaryEWSModel
    
    private let _localeDataSource: DoctorSummaryEWSLocaleDataSource
    private let _remoteDataSource: RemoteDataSource
    private let _mapper: Transformer
    
    public init(
        localeDataSource: DoctorSummaryEWSLocaleDataSource,
        remoteDataSource: RemoteDataSource,
        mapper: Transformer
    ){
        _localeDataSource = localeDataSource
        _remoteDataSource = remoteDataSource
        _mapper = mapper
    }
    
    public func execute(request: Any?) -> AnyPublisher<DoctorSummaryEWSModel, Error> {
        return _remoteDataSource.execute(request: request)
            .map { _mapper.transformResponseToDomain(request: request, response: $0) }
            .eraseToAnyPublisher()
    }
}


