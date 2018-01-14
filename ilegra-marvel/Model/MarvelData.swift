//
//  MarvelData.swift
//  ilegra-marvel
//
//  Created by Michel Anderson Lutz Teixeira on 12/01/2018.
//  Copyright © 2018 Michel Anderson Lutz Teixeira. All rights reserved.
//

import Foundation
import ObjectMapper

/**
 MarvelData extends `Mappable`
    - SeeAlso: `Mappable`
*/
struct MarvelData: Mappable{
    ///Int offset
    var offset: Int
    ///Int limit
    var limit: Int
    ///Int total
    var total: Int
    ///Int count
    var count: Int
    ///Array [Character] results
    var results: [Character]
    
    /**
     - Parameter map: `Map`
     */
    init?(map: Map) {
        offset = (try? map.value("offset")) ?? 0
        limit = (try? map.value("offset")) ?? 0
        total = (try? map.value("offset")) ?? 0
        count = (try? map.value("offset")) ?? 0
        results = [(try? map.value("results")) ?? Character(map: map)!]
    }
    /**
     - Parameter map: `Map`
     */
    mutating func mapping(map: Map) {
        offset <- map["total_count"]
        limit <- map["limit"]
        total <- map["total"]
        count <- map["count"]
        results <- map["results"]
    }
}
