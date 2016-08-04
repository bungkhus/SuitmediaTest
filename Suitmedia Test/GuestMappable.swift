//
//  GuestMappable.swift
//  Suitmedia Test
//
//  Created by Bungkhus on 8/4/16.
//  Copyright © 2016 Bungkhus. All rights reserved.
//

import UIKit
import ObjectMapper

class GuestMappable: Mappable {
    var id: Int?
    var name: String?
    var birthdate: String?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        birthdate <- map["birthdate"]
    }
}
