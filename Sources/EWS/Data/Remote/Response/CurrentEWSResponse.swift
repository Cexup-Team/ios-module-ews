//
//  File.swift
//  
//
//  Created by Iqbal Nur Haq on 09/10/23.
//

public struct CurrentEWSResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case code
        case success
        case message
        case data
    }
    
    let code: String
    let success: Bool
    let message: String
    let data: DoctorHistoryEWSDataResponse
    
}
