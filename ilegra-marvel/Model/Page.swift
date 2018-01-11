//
//  Page.swift
//  ilegra-marvel
//
//  Created by Michel Anderson Lutz Teixeira on 11/01/2018.
//  Copyright © 2018 Michel Anderson Lutz Teixeira. All rights reserved.
//

import Foundation
import ObjectMapper

/**
 Page extends `Mappable`
 
 - SeeAlso: `Mappable`
 */
struct Page: Mappable{
    ///Int total_count
    var total_count: Int
    //[Character] items
    var results: [Character]
    /**
     - Parameter map: `Map`
     */
    init?(map: Map) {
        total_count = (try? map.value("total_count")) ?? 0
        results = [(try? map.value("results")) ?? Character(map: map)!]
    }
    /**
     - Parameter map: `Map`
     */
    mutating func mapping(map: Map) {
        total_count <- map["total_count"]
        results <- map["results"]
    }
}
