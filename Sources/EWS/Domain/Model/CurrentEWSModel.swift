//
//  File.swift
//  
//
//  Created by Iqbal Nur Haq on 09/10/23.
//

import Foundation

public struct CurrentEWSModel: Equatable {
    public let user_code: String
    public let point: Int
    public let result: String
    public let cause: [String]
    public let produce_at: Int
}
