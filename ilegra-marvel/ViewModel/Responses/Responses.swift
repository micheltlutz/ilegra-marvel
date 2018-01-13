//
//  Responses.swift
//  ilegra-marvel
//
//  Created by Michel Anderson Lutz Teixeira on 10/01/2018.
//  Copyright © 2018 Michel Anderson Lutz Teixeira. All rights reserved.
//

import Foundation

/**
 Response Page
 
 - success:  Page
 - serverError: ServerError
 - timeOut: ServerError
 - noConnection: ServerError
 */
enum ResponseMarvelInfo{
    ///success: Page
    case success(model: MarvelInfo)
    ///serverError: ServerError
    case serverError(description: ServerError)
    ///timeOut: ServerError
    case timeOut(desciption: ServerError)
    ///noConnection: ServerError
    case noConnection(description: ServerError)
}

/**
 Response Character
 
 - success:  [Pull]
 - serverError: ServerError
 - timeOut: ServerError
 - noConnection: ServerError
 */
enum ResponseCharacter{
    ///success:  [Pull]
    case success(model: [Character])
    ///serverError: ServerError
    case serverError(description: ServerError)
    ///timeOut: ServerError
    case timeOut(desciption: ServerError)
    ///noConnection: ServerError
    case noConnection(description: ServerError)
}
