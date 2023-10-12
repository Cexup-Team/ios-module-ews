//
//  File.swift
//  
//
//  Created by Iqbal Nur Haq on 09/10/23.
//

import Foundation
import Core

public struct CurrentEWSTransformer: Mapper {
    
    public typealias Request = Any
    public typealias Response = DoctorHistoryEWSDataResponse
    public typealias Entity = DoctorHistoryEWSDataResponse
    public typealias Domain = CurrentEWSModel
    
    public init(){}
    
    public func transformResponseToEntity(request: Request?, response: DoctorHistoryEWSDataResponse) -> DoctorHistoryEWSDataResponse {
        fatalError()
    }
    
    public func transformEntityToDomain(entity: DoctorHistoryEWSDataResponse) -> CurrentEWSModel {
        fatalError()
    }
    
    public func transformResponseToDomain(request: Request?, response: DoctorHistoryEWSDataResponse) -> CurrentEWSModel {
        
        return CurrentEWSModel(
            user_code: response.user_code,
            point: response.point,
            result: response.result,
            cause: response.cause,
            produce_at: response.produce_at
        )
    
    }
}
