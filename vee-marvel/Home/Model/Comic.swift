//
//  Comic.swift
//  vee-marvel
//
//  Created by Edno Fedulo on 02/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import Foundation

struct Comic:Codable {
    let id:Int
    let title:String
    let thumbnail:Image
}
