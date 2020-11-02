//
//  BaseService.swift
//  vee-marvel
//
//  Created by Edno Fedulo on 01/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import Foundation
import Alamofire

class BaseService {
    
    let privateKey = "1fe66aa3abcf93769ad1f0ac38d64b8a1b5c9b1a"
    let publicKey = "0cd68d359595b50d290c8447c780ea12"
    let timestamp = Int64(Date().timeIntervalSince1970 * 1000)
    var hash:String {
        get{
            return "\(self.timestamp)\(self.privateKey)\(self.publicKey)".md5
        }
    }

}
