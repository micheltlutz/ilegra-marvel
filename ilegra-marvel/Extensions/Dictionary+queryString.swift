//
//  Dictionary+queryString.swift
//  ilegra-marvel
//
//  Created by Michel Anderson Lutz Teixeira on 11/01/2018.
//  Copyright © 2018 Michel Anderson Lutz Teixeira. All rights reserved.
//

import Foundation

extension Dictionary {
    var queryString: String? {
        return self.reduce("") { "\($0!)\($1.0)=\($1.1)&" }
    }
}
