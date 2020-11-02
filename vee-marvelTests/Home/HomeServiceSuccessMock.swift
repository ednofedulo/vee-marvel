//
//  HomeServiceSuccessMock.swift
//  vee-marvelTests
//
//  Created by Edno Fedulo on 01/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import Foundation
@testable import vee_marvel

class HomeServiceSuccessMock:HomeServiceProtocol {
    func getMarvelCharacters(offset: Int, limit: Int, completionHandler: @escaping (DataWrapper<MarvelCharacter>?, String?) -> Void) {
        
        let result = DataWrapper(code: 200, status: "Ok", attributionText: "Data provided by Marvel. © 2020 MARVEL", data: DataContainer(offset: offset, limit: limit, total: 1493, count: 20, results: [MarvelCharacter(id: 1, name: "test 1", description: "description 1", modified: Date(), thumbnail: Image(path: "", extension: ""), comicList: MarvelCharacter.ComicList(collectionURI: "")),
        MarvelCharacter(id: 2, name: "test 2", description: "description 2", modified: Date(), thumbnail: Image(path: "", extension: ""), comicList: MarvelCharacter.ComicList(collectionURI: ""))]))
        
        completionHandler(result, nil) 
    }
}
