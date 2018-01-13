//
//  ApiURL.swift
//  ilegra-marvel
//
//  Created by Michel Anderson Lutz Teixeira on 10/01/2018.
//  Copyright © 2018 Michel Anderson Lutz Teixeira. All rights reserved.
//

import Foundation
import CryptoSwift


class ApiURL{
    static let basePath = "https://gateway.marvel.com/v1/public"
    static let pathCharacters = "/characters?"
    static let pathCharacter = "/characters?"
    static let limit = 50
    static private let privateKey = "3579b3647844d2fea06b93f966204ba2e13fcd7b"
    static private let publicKey = "963a1782f76f0085c4d3bdfdb4a698a0"
    
    static func getCredentials() -> String{
        let ts = Date().timeIntervalSince1970.description
        let hash = "\(ts)\(privateKey)\(publicKey)".md5()
        let authParams = ["ts": ts, "apikey": publicKey, "hash": hash]
        return authParams.queryString!
    }
}
