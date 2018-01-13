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
 Class RequestCharacter
 
 - Extends: `Request`
 */
class RequestCharacter: Request{
    
    func loadCharacters(name: String?, page: Int = 0, onComplete: @escaping (_ response: ResponseMarvelInfo) -> Void){
        let offset = page * ApiURL.limit
        var queryParams: [String:String] = ["offset": String(offset), "limit": String(ApiURL.limit)]
        if let name = name, !name.isEmpty{
            queryParams["nameStartsWith"] = name.replacingOccurrences(of: " ", with: "")
        }
        
        let url = ApiURL.basePath + ApiURL.pathCharacters + queryParams.queryString! + ApiURL.getCredentials()
        print("\n\n\n\n\nURL API\n\n\n\n\n", url, "\n\n\n\n\n")
        Alamofire.request(url).responseJSON { (response) in
            let statusCode = response.response?.statusCode
            switch response.result{
                case .success(let value):
                    let resultValue = value as? [String: Any]
                    if statusCode == 200{
                        //let model = Mapper<MarvelInfo>().mapArray(JSONArray: response.result.value as! [[String : Any]])
                        let model = Mapper<MarvelInfo>().map(JSONObject:resultValue)
                        onComplete(.success(model: model!))
                    }
                case .failure(let error):
                    //Status de erro
                    let errorCode = error._code
                    if errorCode == -1009 {
                        let erro = ServerError(msgError: error.localizedDescription, statusCode: errorCode)
                        onComplete(.noConnection(description: erro))
                    } else if errorCode == -1001 {
                        let erro = ServerError(msgError: error.localizedDescription, statusCode: errorCode)
                        onComplete(.timeOut(desciption: erro))
                    }
            }//switch
        }//alamofire
    }//loadCharacters
}
