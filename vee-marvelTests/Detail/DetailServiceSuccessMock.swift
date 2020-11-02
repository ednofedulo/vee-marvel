//
//  DetailServiceSuccessMock.swift
//  vee-marvelTests
//
//  Created by Edno Fedulo on 01/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import Foundation
@testable import vee_marvel

class DetailServiceSuccessMock:DetailServiceProtocol {
    func getComics(from url: String, completionHandler: @escaping (DataWrapper<Comic>?, String?) -> Void) {
        let result = DataWrapper(code: 200, status: "Ok", attributionText: "Data provided by Marvel. © 2020 MARVEL", data: DataContainer(offset: 0, limit: 20, total: 1493, count: 20, results: [Comic(id: 1, title: "comic 1", thumbnail: Image(path: "", extension: "")),
        Comic(id: 2, title: "comic 2", thumbnail: Image(path: "", extension: ""))]))
        
        completionHandler(result, nil)
    }
}
