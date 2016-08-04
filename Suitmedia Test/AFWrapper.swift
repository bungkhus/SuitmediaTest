//
//  AFWrapper.swift
//  Suitmedia Test
//
//  Created by Bungkhus on 8/4/16.
//  Copyright © 2016 Bungkhus. All rights reserved.
//

import Alamofire
import SwiftyJSON
import UIKit

class AFWrapper: NSObject {
    class func requestGETURL(strURL: String, success:(JSON) -> Void, failure:(NSError) -> Void) {
        Alamofire.request(.GET, strURL).responseJSON { (responseObject) -> Void in
            
            print(responseObject)
            
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                success(resJson)
            }
            if responseObject.result.isFailure {
                let error : NSError = responseObject.result.error!
                failure(error)
            }
        }
    }
    
    class func requestPOSTURL(strURL : String, params : [String : AnyObject]?, headers : [String : String]?, success:(JSON) -> Void, failure:(NSError) -> Void){
        Alamofire.request(.POST, strURL, parameters: params, encoding: ParameterEncoding.JSON, headers: headers).responseJSON { (responseObject) -> Void in
            
            print(responseObject)
            
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                success(resJson)
            }
            if responseObject.result.isFailure {
                let error : NSError = responseObject.result.error!
                failure(error)
            }
        }
    }
}