//
//  ApiURL.swift
//  ilegra-marvel
//
//  Created by Michel Anderson Lutz Teixeira on 10/01/2018.
//  Copyright © 2018 Michel Anderson Lutz Teixeira. All rights reserved.
//

import Foundation
import CryptoSwift
import Dollar
//import Keys

fileprivate struct MarvelAPIConfig {
    //fileprivate static let keys = MarvelKeys()
    static let privatekey = "3579b3647844d2fea06b93f966204ba2e13fcd7b"
    static let apikey = "963a1782f76f0085c4d3bdfdb4a698a0"
    static let ts = Date().timeIntervalSince1970.description
    static let hash = "\(ts)\(privatekey)\(apikey)".md5()
}

/*
 Your public key
 963a1782f76f0085c4d3bdfdb4a698a0
 
 Your private key
 3579b3647844d2fea06b93f966204ba2e13fcd7b
 */

enum MarvelAPI {
    case characters(String?)
    case character(String)
}

/**
 Struct ApiURL
 */
struct ApiURL{
    /// - String base
    static let baseURL: String = "https://gateway.marvel.com"
    static let characters: String = baseURL + "/v1/public/characters";
    static let character: String = baseURL + "/v1/public/characters/"
    func authParameters() -> [String: String] {
        return ["apikey": MarvelAPIConfig.apikey,
                "ts": MarvelAPIConfig.ts,
                "hash": MarvelAPIConfig.hash]
    }
}
