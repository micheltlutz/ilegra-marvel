//
//  MarvelInfo.swift
//  ilegra-marvel
//
//  Created by Michel Anderson Lutz Teixeira on 12/01/2018.
//  Copyright © 2018 Michel Anderson Lutz Teixeira. All rights reserved.
//

import Foundation
import ObjectMapper

/**
 MarvelInfo extends `Mappable`
 - SeeAlso: `Mappable`
 */
struct MarvelInfo: Mappable{
    ///Int code
    var code: Int
    //String status
    var status: String
    //MarvelData data
    var data: MarvelData
    /**
     - Parameter map: `Map`
     */
    init?(map: Map) {
        code = (try? map.value("code")) ?? 0
        status = (try? map.value("status")) ?? ""
        data = (try? map.value("data")) ?? MarvelData(map: map)!
    }
    /**
     - Parameter map: `Map`
     */
    mutating func mapping(map: Map) {
        code <- map["code"]
        status <- map["status"]
        data <- map["data"]
    }
}
