//
//  DetailService.swift
//  vee-marvel
//
//  Created by Edno Fedulo on 01/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import Foundation


import Foundation
import Alamofire

protocol DetailServiceProtocol:AnyObject {
    func getComics(from url: String, completionHandler: @escaping(_ data: DataWrapper<Comic>?, _ error: String?) -> Void)
}

class DetailService: BaseService, DetailServiceProtocol {
    
    func getComics(from url: String, completionHandler: @escaping (DataWrapper<Comic>?, String?) -> Void) {
        
        let url = "\(url)?ts=\(self.timestamp)&apikey=\(self.publicKey)&hash=\(self.hash)"
        
        AF.request(url).responseDecodable(of: DataWrapper<Comic>.self) { response in
            switch response.result {
            case let .success(value):
                completionHandler(value, nil)
            case .failure(_):
                completionHandler(nil, "Erro ao consultar API")
            }
        }
    }
}
