//
//  File.swift
//  
//
//  Created by Iqbal Nur Haq on 22/05/23.
//

import Foundation

public struct DoctorListEWSResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case code
        case success
        case message
        case data
    }
    
    let code: String
    let success: Bool
    let message: String
    let data: [DoctorListEWSDataResponse]
    
}

public struct DoctorListEWSDataResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case user_code
        case name
        case ews
    }
    
    let user_code: String
    let name: String
    let ews: String
    
}

