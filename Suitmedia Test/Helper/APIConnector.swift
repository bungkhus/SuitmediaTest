//
//  APIConnector.swift
//  Suitmedia Test
//
//  Created by Bungkhus on 8/9/16.
//  Copyright © 2016 Bungkhus. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

public class APIConnector {

    public static let instance = APIConnector()
    let url = "http://dry-sierra-6832.herokuapp.com/api/people"
    
    func getGuests(success:([Guest]) -> Void, failure: (NSError) -> Void) -> Void {
        Alamofire.request(.GET,url)
            .responseArray { (response: Response<[Guest], NSError>) in
                switch response.result {
                case .Success(let guests):
                    success(guests)
                case .Failure(let error):
                    failure(error)
                }
        }
    }

}