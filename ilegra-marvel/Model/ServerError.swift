//
//  ServerError.swift
//  ilegra-marvel
//
//  Created by Michel Anderson Lutz Teixeira on 10/01/2018.
//  Copyright © 2018 Michel Anderson Lutz Teixeira. All rights reserved.
//

import Foundation
/**
 struct ServerError guarda informação de erro de servidor e status code do mesmo
 */
struct ServerError{
    ///String msgError
    let msgError: String
    ///Int statusCode
    let statusCode: Int
}
