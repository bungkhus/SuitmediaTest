//
//  GuestInteractor.swift
//  Suitmedia Test
//
//  Created by Bungkhus on 8/5/16.
//  Copyright © 2016 Bungkhus. All rights reserved.
//

import Foundation
import RealmSwift

class GuestInteractor: BaseInteractor {
    
    var datas = [Guest]()
    var guestModel = Guest()
    var msg:String?
    
    func refresh(success:([Guest]) -> Void, failure: (NSError) -> Void) -> Void {
        api.getGuests({ guests in
            do {
                try self.realm.write {
                    for guest in guests {
                        self.realm.add(guest,update: true)
                    }
                }
                self.datas.removeAll()
                success(self.load())
            } catch let error as NSError {
                self.msg = "Error while interaction with realm"
                failure(error)
            }
            }, failure: { error in
                self.msg = "Error while requesting data from server!"
                failure(error)
        })

    }
    
    func load() -> [Guest]{
        self.guestModel = Guest()
        let results = self.realm.objects(Guest.self)
        for guest in results {
            self.guestModel = Guest(value: guest)
            self.datas.append(self.guestModel)
        }
        return self.datas
    }
    
}