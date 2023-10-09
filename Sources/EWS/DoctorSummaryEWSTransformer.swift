//
//  File.swift
//  
//
//  Created by Iqbal Nur Haq on 13/01/23.
//

import Foundation
import Core

public struct DoctorSummaryEWSTransformer: Mapper {
    public typealias Request = Any
    public typealias Response = DoctorSummaryEWSDataResponse
    public typealias Entity = DoctorSummaryEWSEntity
    public typealias Domain = DoctorSummaryEWSModel
    
    public init(){}
    
    public func transformResponseToEntity(request: Request?, response: DoctorSummaryEWSDataResponse) -> DoctorSummaryEWSEntity {
        let summaryEwsEntity = DoctorSummaryEWSEntity()
        summaryEwsEntity.id = UUID().uuidString
        summaryEwsEntity.normal = response.normal
        summaryEwsEntity.low = response.rendah
        summaryEwsEntity.moderate = response.sedang
        summaryEwsEntity.high = response.tinggi
        
        return summaryEwsEntity
    }
    
    public func transformEntityToDomain(entity: DoctorSummaryEWSEntity) -> DoctorSummaryEWSModel {
        return DoctorSummaryEWSModel(
            normal: entity.normal,
            low: entity.low,
            moderate: entity.moderate,
            high: entity.high
        )
    }
    
    public func transformResponseToDomain(request: Request?, response: DoctorSummaryEWSDataResponse) -> DoctorSummaryEWSModel {
        return DoctorSummaryEWSModel(
            normal: response.normal,
            low: response.rendah,
            moderate: response.sedang,
            high: response.tinggi
        )
    }
        
}

