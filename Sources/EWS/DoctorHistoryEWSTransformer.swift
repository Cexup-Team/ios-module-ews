//
//  File.swift
//  
//
//  Created by Iqbal Nur Haq on 24/05/23.
//

import Foundation
import Core

public struct DoctorHistoryEWSTransformer: Mapper {
    
    public typealias Request = Any
    public typealias Response = [DoctorHistoryEWSDataResponse]
    public typealias Entity = [DoctorHistoryEWSDataResponse]
    public typealias Domain = [DoctorHistoryEWSModel]
    
    public init(){}
    
    public func transformResponseToEntity(request: Request?, response: [DoctorHistoryEWSDataResponse]) -> [DoctorHistoryEWSDataResponse] {
        fatalError()
    }
    
    public func transformEntityToDomain(entity: [DoctorHistoryEWSDataResponse]) -> [DoctorHistoryEWSModel] {
        fatalError()
    }
    
    public func transformResponseToDomain(request: Request?, response: [DoctorHistoryEWSDataResponse]) -> [DoctorHistoryEWSModel] {
        return response.map { result in
            return DoctorHistoryEWSModel(
                user_code: result.user_code,
                point: result.point,
                result: result.result,
                cause: result.cause,
                produce_at: result.produce_at
            )
        }
    }
}
