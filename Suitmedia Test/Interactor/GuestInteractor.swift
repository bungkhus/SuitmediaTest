//
//  GuestInteractor.swift
//  Suitmedia Test
//
//  Created by Bungkhus on 8/5/16.
//  Copyright © 2016 Bungkhus. All rights reserved.
//

import Foundation
import RealmSwift
import PKHUD

class GuestInteractor {
    
    let realm = try! Realm()
    var datas = [Guest]()
    var guestModel = Guest()
    let msg = "You are offline!"
    
    func fetcData(success:() -> Void, failure: (NSError) -> Void) -> Void {
        APIConnector.instanct.getGuests({ guests in
            do {
                let realm = try Realm()
                self.datas = guests
                try realm.write {
                    for guest in guests {
                        realm.add(guest,update: true)
                    }
                }
                success()
            } catch let error as NSError {
                HUD.flash(.Label(self.msg), delay: 2.0) { _ in
                    print(error)
                }
                self.guestModel = Guest()
                let results = self.realm.objects(Guest.self)
                for guest in results {
                    self.guestModel = Guest(value: guest)
                    self.datas.append(self.guestModel)
                }
                failure(error)
            }
            }, failure: { error in
                HUD.flash(.Label(self.msg), delay: 2.0) { _ in
                    print(error)
                }
                self.guestModel = Guest()
                let results = self.realm.objects(Guest.self)
                for guest in results {
                    self.guestModel = Guest(value: guest)
                    self.datas.append(self.guestModel)
                }
                failure(error)
        })

    }
    
}