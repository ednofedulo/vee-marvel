//
//  Image.swift
//  vee-marvel
//
//  Created by Edno Fedulo on 02/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import Foundation

struct Image:Codable {
    let path:String
    let `extension`:String
    
    var urllandscape: URL? {
        get{
            return URL(string: "\(path)/landscape_xlarge.\(`extension`)")
        }
    }
    
    var urlportrait:URL? {
        get{
            return URL(string: "\(path)/portrait_xlarge.\(`extension`)")
        }
    }
}
