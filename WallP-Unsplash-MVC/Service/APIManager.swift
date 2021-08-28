//
//  APIManager.swift
//  WallP-Unsplash-MVC
//
//  Created by ADMIN on 08/02/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import Foundation

enum HttpMethod: String {
    case GET
    case POST
}

class APIManager {
    static let shared = APIManager()
    private init() {}
    
    func fetchData(url: String, header: [String: String]?, method: HttpMethod = .GET, completion: @escaping(Data?, Error?) -> Void) {
        
        guard let url = URL(string: url) else {
            print("URL Not Valid.")
            return
        }
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = method.rawValue
        
        if let header = header {
            for param in header {
                urlRequest.addValue(param.value, forHTTPHeaderField: param.key)
            }
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let data = data, let response = response {
                print(response)
                completion(data, nil)
            }else{
                completion(nil, error)
            }
        }
        task.resume()
    }
}
