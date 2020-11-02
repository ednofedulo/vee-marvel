//
//  DataContainer.swift
//  vee-marvel
//
//  Created by Edno Fedulo on 01/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import Foundation

struct DataContainer<T:Codable>:Codable {
    let offset:Int?
    let limit:Int?
    let total:Int?
    let count:Int?
    let results:[T]?
}
