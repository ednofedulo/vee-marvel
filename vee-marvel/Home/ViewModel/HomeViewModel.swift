//
//  HomeViewModel.swift
//  vee-marvel
//
//  Created by Edno Fedulo on 30/10/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import Foundation

protocol HomeViewModelViewDelegate: AnyObject {
    func didFetchDataFromAPISuccess(sender: HomeViewModel)
    func didFetchDataFromAPIFail(sender: HomeViewModel)
}

class HomeViewModel {
    
    weak var delegate:HomeViewModelViewDelegate?
    weak var coodinator: AppCoordinator?
    var characters:[MarvelCharacter]?
    weak var viewDelegate:HomeViewModelViewDelegate?
    
    lazy var service:HomeServiceProtocol = HomeService()
    
    
    /// Fetch the characters from the API
    func fetchData() {
        service.getMarvelCharacters(offset: (characters?.count ?? 0), limit: 20) { (data, error) in
            guard error == nil else {
                self.viewDelegate?.didFetchDataFromAPIFail(sender: self)
                return
            }
            
            if (self.characters?.count ?? 0) == 0 {
                self.characters = data?.data?.results
            } else {
                if let data = data, let container = data.data, let results = container.results {
                    self.characters?.append(contentsOf: results)
                }
            }
            
            self.viewDelegate?.didFetchDataFromAPISuccess(sender: self)
        }
    }
    
    
    /// Return the character for the respective row
    /// - Parameter row: row
    /// - Returns: Marvel Character
    func getCharacter(for row:Int) -> MarvelCharacter? {
        if let characters = self.characters {
            return characters[row]
        }
        return nil
    }
    
    
    /// Show the detail page
    /// - Parameter index: character index
    func didSelectRow(at index: Int){
        if let character = getCharacter(for: index) {
            self.coodinator?.showDetail(for: character)
        }
    }
}
