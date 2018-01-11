//
//  Character.swift
//  ilegra-marvel
//
//  Created by Michel Anderson Lutz Teixeira on 10/01/2018.
//  Copyright © 2018 Michel Anderson Lutz Teixeira. All rights reserved.
//

import Foundation

import ObjectMapper

/**
 Character extends `Mappable`
 - SeeAlso: `Mappable`
 */
struct Character: Mappable{
    ///Int id
    var id: Int
    ///String name
    var name: String
    ///String description
    var description: String
    ///String thumbnail
    var thumbnail: String
    
    /**
     - Parameter map: `Map`
     */
    init?(map: Map){
        id = (try? map.value("id")) ?? 0
        name = (try? map.value("name")) ?? ""
        description = (try? map.value("description")) ?? ""
        thumbnail = (try? map.value("thumbnail")) ?? ""
    }
    
    /**
     - Parameter map: `Map`
     */
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
        thumbnail <- map["thumbnail"]
    }
}
