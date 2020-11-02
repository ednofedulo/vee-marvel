//
//  DetailViewModel.swift
//  vee-marvel
//
//  Created by Edno Fedulo on 31/10/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import Foundation

protocol DetailViewModelViewDelegate: AnyObject {
    func didFetchDataSuccess(sender: DetailViewModel)
    func didFetchDataFail(sender: DetailViewModel)
}

class DetailViewModel {
    
    var character:MarvelCharacter
    var comics:[Comic]?
    weak var viewDelegate: DetailViewModelViewDelegate?
    lazy var service:DetailServiceProtocol = DetailService()
    
    init(character:MarvelCharacter) {
        self.character = character   
    }
    
    /// fetch comics from the API
    func fetchComics(){
        self.service.getComics(from: self.character.comicList!.collectionURI!) { (data, error) in
            guard error == nil else {
                self.viewDelegate?.didFetchDataFail(sender: self)
                return
            }
            
            self.comics = data?.data?.results
            self.viewDelegate?.didFetchDataSuccess(sender: self)
        }
    }
}
