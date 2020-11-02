//
//  String+extension.swift
//  vee-marvel
//
//  Created by Edno Fedulo on 01/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import Foundation
import CryptoKit


extension String {
    var md5: String {
        let hash = Insecure.MD5.hash(data: self.data(using: .utf8)!)
        return hash.map { String(format: "%02hhx", $0) }.joined()
    }
}
