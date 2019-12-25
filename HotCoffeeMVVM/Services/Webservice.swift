//
//  Webservice.swift
//  HotCoffeeMVVM
//
//  Created by Agnes Lo on 2019/12/25.
//  Copyright © 2019 Agnes Lo. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    
    case decodingError
    case domainError
    case urlError
}

struct Resource<T: Codable> {
    let url: URL
}

class Webservice {
    
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        URLSession.shared.dataTask(with: resource.url, completionHandler: { (data, response, error) in
            
            guard let data = data, error == nil else {
                
                completion(.failure(.domainError))
                
                return
            }
            
            let result = try? JSONDecoder().decode(T.self, from: data)
            
            if let result = result {
                
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } else {
                
                completion(.failure(.decodingError))
            }
            
            
        }).resume()
    }
}
