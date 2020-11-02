//
//  HomeService.swift
//  vee-marvel
//
//  Created by Edno Fedulo on 31/10/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import Foundation
import Alamofire

protocol HomeServiceProtocol:AnyObject {
    func getMarvelCharacters(offset:Int, limit:Int, completionHandler: @escaping(_ data: DataWrapper<MarvelCharacter>?, _ error: String?) -> Void)
}

class HomeService: BaseService, HomeServiceProtocol {
    func getMarvelCharacters(offset:Int, limit:Int, completionHandler: @escaping (DataWrapper<MarvelCharacter>?, String?) -> Void) {
        
        let url = "https://gateway.marvel.com:443/v1/public/characters?offset=\(offset)&ts=\(self.timestamp)&apikey=\(self.publicKey)&hash=\(self.hash)"
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        AF.request(url).responseDecodable(of: DataWrapper<MarvelCharacter>.self, decoder: decoder) { response in
            switch response.result {
            case let .success(value):
                completionHandler(value, nil)
            case .failure(_):
                completionHandler(nil, "Erro ao consultar API")
            }
        }
    }
}
