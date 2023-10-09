//
//  File.swift
//  
//
//  Created by Iqbal Nur Haq on 13/01/23.
//

import Foundation

public struct DoctorSummaryEWSResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case code
        case success
        case message
        case data
    }
    
    let code: String
    let success: Bool
    let message: String
    let data: DoctorSummaryEWSDataResponse?
    
}

public struct DoctorSummaryEWSDataResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case normal
        case rendah
        case sedang
        case tinggi
    }
    
    let normal: Int
    let rendah: Int
    let sedang: Int
    let tinggi: Int
    
}


