//
//  Guest.swift
//  Suitmedia Test
//
//  Created by Bungkhus on 8/3/16.
//  Copyright © 2016 Bungkhus. All rights reserved.
//

import UIKit
//import SwiftyJSON

struct Guest {
    var name: String?
    var birthdate: NSDate?
    var image: String?
    
    init(name: String?, birthdate: NSDate?, image: String?) {
        self.name = name
        self.birthdate = birthdate
        self.image = image
    }
    /*
 var name: String?
 var birthdate: String?
 var image: String?
 
 static func initialData(data: JSON?) -> Guest {
 var guest = Guest()
 if let data = data {
 if data["name"].isExists() {
 let name:String = data["name"].string!
 guest.name = name
 }
 if data["birthdate"].isExists() {
 let birthdate:String = data["birthdate"].string!
 guest.birthdate = birthdate
 }
 guest.image = "logo"
 return guest
 }
 return guest
 }
 */
}