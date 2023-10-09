//
//  File.swift
//  
//
//  Created by Iqbal Nur Haq on 22/05/23.
//

import Foundation
import Alamofire
import Combine
import Core

public struct DoctorListEWSRemoteDataSource: DataSource {
   
    
    public typealias Request = Any
    public typealias Response = [DoctorListEWSDataResponse]
    
    private let _endpoint: String
    private let _apiKey: String
    
    public init(endpoint: String, apiKey: String) {
        _endpoint = endpoint
        _apiKey = apiKey
    }
    
    public func execute(request: Any?) -> AnyPublisher<[DoctorListEWSDataResponse], Error> {
    
        
        let headers: HTTPHeaders = [
            "x-api-key" : _apiKey,
            "Authorization" : "Bearer \(Prefs.shared.accessTokenPrefs)"
        ]
        
        return Future<[DoctorListEWSDataResponse], Error> { completion in
            guard Prefs.shared.doctorIdPrefs != "" else { return completion(.failure(URLError.invalidRequest)) }
            if let url = URL(string: _endpoint + Prefs.shared.doctorIdPrefs + "/" + String(describing: request!)) {
                AF.request(url, method: .get, parameters: request as? Parameters, encoding: JSONEncoding.default, headers: headers)
                    .responseDecodable(of: DoctorListEWSResponse.self) { response in
                        
                       
                        switch response.result {
                        case .success(let value):
                            if Int(value.code) == 200 {
                                completion(.success(value.data))
                            }else{
                                completion(.failure(URLError.custom(value.message)))
                            }
                            
                        case .failure(_):
                            completion(.failure(URLError.invalidRequest))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
}


