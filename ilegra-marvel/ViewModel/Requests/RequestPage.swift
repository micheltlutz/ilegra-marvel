//
//  RequestPage.swift
//  ilegra-marvel
//
//  Created by Michel Anderson Lutz Teixeira on 11/01/2018.
//  Copyright © 2018 Michel Anderson Lutz Teixeira. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
/**
 Class RequestPage
 - Extends `Request`
 */
class RequestPage: Request{
    /**
     func getDataPage retorna Model ResponsePage
     
     - Parameters:
     - page: Número da página em String
     - completion: @escaping `ResponsePage`
     
     - SeeAlso: `ResponsePage`
     */
    func getDataPage(page: String?, completion: @escaping(_ response: ResponsePage) -> Void){
        let url = page == "" || page == nil ? ApiURL.characters + "?orderBy=name&limit=10" : ApiURL.characters + "?orderBy=name&limit=10&" + ApiURL().authParameters().queryString!
    
        print("URL: \(url)")
        print("\n\n authParameters: \(ApiURL().authParameters())")
        print("authParameters-queryString: \(ApiURL().authParameters().queryString!)")
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
                        let model = Mapper<Page>().map(JSONObject:response.result.value)
                        
                        
                        print("MODEL",response.result.value)
                        
                        
                        completion(.success(model: model!))
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
