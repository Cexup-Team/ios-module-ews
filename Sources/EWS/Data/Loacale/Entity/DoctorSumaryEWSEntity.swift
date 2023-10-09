//
//  File.swift
//  
//
//  Created by Iqbal Nur Haq on 13/01/23.
//

import Foundation
import RealmSwift

public class DoctorSummaryEWSEntity: Object {
    @Persisted(primaryKey: true) var id: String?
    @Persisted var normal: Int
    @Persisted var low: Int
    @Persisted var moderate: Int
    @Persisted var high: Int
}

