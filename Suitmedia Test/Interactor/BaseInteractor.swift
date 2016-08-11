//
//  BaseInteractor.swift
//  Suitmedia Test
//
//  Created by Bungkhus on 8/10/16.
//  Copyright © 2016 Bungkhus. All rights reserved.
//

import Foundation
import RealmSwift

class BaseInteractor: NSObject {
    
    private var _realm: Realm?
    
    var realm: Realm {
        if let realm = _realm {
            return realm
        }
        return try! Realm()
    }
    
    let api: APIConnector
    var lastError: NSError? = nil
    
    convenience override init() {
        self.init(realm: nil, apiConnector: APIConnector.instance)
    }
    
    init(realm: Realm?, apiConnector: APIConnector) {
        if let realm = realm {
            _realm = realm
        }
        self.api = apiConnector
    }
}