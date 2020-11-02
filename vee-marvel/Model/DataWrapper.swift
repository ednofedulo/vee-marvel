//
//  DataWrapper.swift
//  vee-marvel
//
//  Created by Edno Fedulo on 01/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import Foundation

struct DataWrapper<T:Codable>:Codable {
    let code: Int?
    let status:String?
    let attributionText:String?
    let data:DataContainer<T>?
}
