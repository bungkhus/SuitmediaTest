//
//  Guest.swift
//  Suitmedia Test
//
//  Created by Bungkhus on 8/3/16.
//  Copyright © 2016 Bungkhus. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Guest: Object, Mappable{
    var id: Int = 0
    var name: String?
    var birthdate: String?
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        birthdate <- map["birthdate"]
    }
}