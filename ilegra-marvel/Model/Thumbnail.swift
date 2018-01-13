//
//  Thumbnail.swift
//  ilegra-marvel
//
//  Created by Michel Anderson Lutz Teixeira on 12/01/2018.
//  Copyright © 2018 Michel Anderson Lutz Teixeira. All rights reserved.
//

import Foundation
import ObjectMapper
/**
 Thumbnail extends `Mappable`
 - SeeAlso: `Mappable`
 */
struct Thumbnail: Mappable{
    ///String path
    var path: String
    ///String ext ( extension )
    var ext: String
    /**
     - Parameter map: `Map`
     */
    init?(map: Map){
        path = (try? map.value("path")) ?? ""
        ext = (try? map.value("extension")) ?? ""
    }
    
    /**
     - Parameter map: `Map`
     */
    mutating func mapping(map: Map) {
        path <- map["path"]
        ext <- map["extension"]
    }
    
    func getUrl() -> String{
        return path + "." + ext
    }
}
