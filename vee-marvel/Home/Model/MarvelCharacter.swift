//
//  MarvelCharacter.swift
//  vee-marvel
//
//  Created by Edno Fedulo on 31/10/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import Foundation


struct MarvelCharacter:Codable {
    
    let id:Int?
    let name:String?
    let description:String?
    let modified:Date?
    let thumbnail:Image?
    let comicList:ComicList?
    var formattedModifiedDate:String? {
        get {
            guard let modified = modified else { return nil }
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            return dateFormatter.string(from: modified)
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case thumbnail
        case comicList = "comics"
        case modified
    }
    
    struct ComicList:Codable {
        let collectionURI:String?
    }
}
