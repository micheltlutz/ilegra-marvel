//
//  CharacterURL.swift
//  ilegra-marvel
//
//  Created by Michel Anderson Lutz Teixeira on 12/01/2018.
//  Copyright © 2018 Michel Anderson Lutz Teixeira. All rights reserved.
//

import Foundation
import ObjectMapper
/**
 CharacterURL extends `Mappable`
 - SeeAlso: `Mappable`
 */
struct CharacterURL: Mappable{
    ///String type
    var type: String
    ///String url
    var url: String
    
    /**
     - Parameter map: `Map`
     */
    init?(map: Map){
        type = (try? map.value("type")) ?? ""
        url = (try? map.value("url")) ?? ""
    }
    
    /**
     - Parameter map: `Map`
     */
    mutating func mapping(map: Map) {
        type <- map["type"]
        url <- map["url"]
    }
}
