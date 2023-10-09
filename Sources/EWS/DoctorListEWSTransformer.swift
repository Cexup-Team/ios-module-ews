//
//  File.swift
//  
//
//  Created by Iqbal Nur Haq on 22/05/23.
//

import Foundation
import Core

public struct DoctorListEWSTransformer: Mapper {
    
    public typealias Request = Any
    public typealias Response = [DoctorListEWSDataResponse]
    public typealias Entity = [DoctorListEWSDataResponse]
    public typealias Domain = [DoctorListEWSModel]
    
    public init(){}
    
    public func transformResponseToEntity(request: Request?, response: [DoctorListEWSDataResponse]) -> [DoctorListEWSDataResponse] {
        fatalError()
    }
    
    public func transformEntityToDomain(entity: [DoctorListEWSDataResponse]) -> [DoctorListEWSModel] {
        fatalError()
    }
    
    public func transformResponseToDomain(request: Request?, response: [DoctorListEWSDataResponse]) -> [DoctorListEWSModel] {
        return response.map { result in
            return DoctorListEWSModel(user_code: result.user_code, name: result.name, ews: result.ews)
        }
    }
}
