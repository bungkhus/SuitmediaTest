//
//  Guest.swift
//  Suitmedia Test
//
//  Created by Bungkhus on 8/3/16.
//  Copyright © 2016 Bungkhus. All rights reserved.
//

import UIKit

struct Guest {
    var name: String?
    var birthdate: NSDate?
    var image: String?
    
    init(name: String?, birthdate: NSDate?, image: String?) {
        self.name = name
        self.birthdate = birthdate
        self.image = image
    }
}