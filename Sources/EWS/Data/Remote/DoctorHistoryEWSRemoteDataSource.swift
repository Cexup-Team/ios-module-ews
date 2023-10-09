//
//  File.swift
//  
//
//  Created by Iqbal Nur Haq on 24/05/23.
//

import Foundation
import Alamofire
import Combine
import Core

public struct DoctorHistoryEWSRemoteDataSource: DataSource {
   
    
    public typealias Request = Any
    public typealias Response = [DoctorHistoryEWSDataResponse]
    
    private let _endpoint: String
    private let _apiKey: String
    
    public init(endpoint: String, apiKey: String) {
        _endpoint = endpoint
        _apiKey = apiKey
    }
    
    public func execute(request: Any?) -> AnyPublisher<[DoctorHistoryEWSDataResponse], Error> {
    
        
        let headers: HTTPHeaders = [
            "x-api-key" : _apiKey,
            "Authorization" : "Bearer \(Prefs.shared.accessTokenPrefs)"
        ]
        
        return Future<[DoctorHistoryEWSDataResponse], Error> { completion in
            guard let resultNew = request as? [String:Any] else { return completion(.failure(URLError.invalidRequest))}
            let user_code = resultNew["user_code"]!
            let page = resultNew["page"]!
            
            if let url = URL(string: "\(_endpoint)\(user_code)?data=15&page=\(String(describing: page))") {
                AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
                    .responseDecodable(of: DoctorHistoryEWSResponse.self) { response in
                        print(response.result)
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
