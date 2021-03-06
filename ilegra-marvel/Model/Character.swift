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
    ///Thumbnail thumbnail
    var thumbnail: Thumbnail
    ///Array CharacterURL
    var urls: [CharacterURL]
    
    /**
     - Parameter map: `Map`
     */
    init?(map: Map){
        id = (try? map.value("id")) ?? 0
        name = (try? map.value("name")) ?? ""
        description = (try? map.value("description")) ?? ""
        thumbnail = (try? map.value("thumbnail")) ?? Thumbnail(map: map)!
        urls = [(try? map.value("urls")) ?? CharacterURL(map: map)!]
    }
    
    /**
     - Parameter map: `Map`
     */
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
        thumbnail <- map["thumbnail"]
        urls <- map["urls"]
    }
}
