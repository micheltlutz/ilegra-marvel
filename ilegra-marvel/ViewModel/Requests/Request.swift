//
//  Request.swift
//  ilegra-marvel
//
//  Created by Michel Anderson Lutz Teixeira on 10/01/2018.
//  Copyright © 2018 Michel Anderson Lutz Teixeira. All rights reserved.
//

import Foundation
import Alamofire

/**
 Class Request
 - Configura SessionManager para requisições a API
 */
class Request{
    /**
     alamofireManager configura SessionManager para requisições
     
     - Returns: `SessionManager`
     */
    let alamofireManager: SessionManager = {
        //Criação das configurações
        let configurarion = URLSessionConfiguration.default
        //Tempo de timeout em milesegundos
        configurarion.timeoutIntervalForRequest = 10000
        configurarion.timeoutIntervalForResource = 10000
        return SessionManager(configuration: configurarion)
    }()
}
