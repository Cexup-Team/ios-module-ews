//
//  File.swift
//  
//
//  Created by Iqbal Nur Haq on 24/05/23.
//


import Foundation

public struct DoctorHistoryEWSModel: Equatable {
    public let user_code: String
    public let point: Int
    public let result: String
    public let cause: [String]
    public let produce_at: Int
}
