//
//  File.swift
//  
//
//  Created by Iqbal Nur Haq on 24/05/23.
//

import Foundation

public struct DoctorHistoryEWSResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case code
        case success
        case message
        case data
    }
    
    let code: String
    let success: Bool
    let message: String
    let data: [DoctorHistoryEWSDataResponse]
    
}

public struct DoctorHistoryEWSDataResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case user_code
        case point
        case result
        case cause
        case produce_at
    }
    
    let user_code: String
    let point: Int
    let result: String
    let cause: [String]
    let produce_at: Int
}
