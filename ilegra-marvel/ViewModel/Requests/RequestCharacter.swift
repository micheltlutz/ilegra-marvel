//
//  RequestCharacter.swift
//  ilegra-marvel
//
//  Created by Michel Anderson Lutz Teixeira on 11/01/2018.
//  Copyright © 2018 Michel Anderson Lutz Teixeira. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

/**
 Class RequestPull
 
 - Extends: `Request`
 */
class RequestCharacter: Request{
    /**
     func getData retorna Model `ResponseCharact`
     
     - Parameters:
     - user: Username do repositório
     - repositoryName: Nome do repositório
     - completion: @escaping `ResponsePull`
     
     - SeeAlso: `ResponsePull`
     */
    func byID(id: String, completion: @escaping(_ response: ResponseCharacter) -> Void){
        ///<criador>/<repositório>/pulls
        let url = ApiURL.character + id
        alamofireManager.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON
            { response in
                let statusCode = response.response?.statusCode
                switch response.result{
                case .success(let value):
                    //json com retorno
                    let resultValue = value as? [String: Any]
                    if statusCode == 404{
                        if let description = resultValue?["message"] as? String{
                            let error = ServerError(msgError: description, statusCode:statusCode!)
                            completion(.serverError(description: error))
                        }
                    } else if statusCode == 200{
                        let model = Mapper<Character>().mapArray(JSONArray: response.result.value as! [[String : Any]])
                        completion(.success(model: model))
                    }
                case .failure(let error):
                    //Status de erro
                    let errorCode = error._code
                    if errorCode == -1009 {
                        let erro = ServerError(msgError: error.localizedDescription, statusCode: errorCode)
                        completion(.noConnection(description: erro))
                    } else if errorCode == -1001 {
                        let erro = ServerError(msgError: error.localizedDescription, statusCode: errorCode)
                        completion(.timeOut(desciption: erro))
                    }
                }
                
        }//alamofireManager
    }//fim getAll
}


