//
//  Event.swift
//  Suitmedia Test
//
//  Created by Bungkhus on 8/1/16.
//  Copyright © 2016 Bungkhus. All rights reserved.
//
import UIKit

struct Event {
    var name: String?
    var date: NSDate?
    var image: String?
    
    init(name: String?, date: NSDate?, image: String?) {
        self.name = name
        self.date = date
        self.image = image
    }
}