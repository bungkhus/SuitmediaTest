//
//  GuestCollectionViewController.swift
//  Suitmedia Test
//
//  Created by Bungkhus on 8/3/16.
//  Copyright © 2016 Bungkhus. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import RealmSwift
import ObjectMapper
import SwiftyJSON
import PKHUD

class GuestCollectionViewController: UICollectionViewController {

    let realm = try! Realm()
    private let reuseIdentifier = "GuestCell"
    var datas = [Guest]()
    var selectedGuest:String?
    var selectedBirthdateGuest:NSDate?
    var guestModel = Guest()
    let url = "http://dry-sierra-6832.herokuapp.com/api/people"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetcData()
    }
    
    func fetcData(){
        Alamofire.request(.GET,url)
            .responseArray { (response: Response<[Guest], NSError>) in
                switch response.result {
                case .Success(let guests):
                    do {
                        let realm = try Realm()
                        self.datas = response.result.value!
                        self.collectionView!.reloadData()
                        try realm.write {
                            for guest in guests {
                                realm.add(guest,update: true)
                            }
                        }
                    } catch let error as NSError {
                        print("Guest 1 Error: \(error)")
                    }
                case .Failure(let error):
                    let msg = "You are offline!"
                    HUD.flash(.Label(msg), delay: 2.0) { _ in
                        print(error)
                    }
                    self.guestModel = Guest()
                    let results = self.realm.objects(Guest.self)
                    for guest in results {
                        self.guestModel = Guest(value: guest)
                        self.datas.append(self.guestModel)
                    }
                    print(results.count)
                    self.collectionView!.reloadData()
                }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GuestCell", forIndexPath: indexPath) as! GuestCell
        
        cell.data = self.datas[indexPath.row]
        
        return cell
    }
    // change background color when user touches cell
    override func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        cell?.backgroundColor = UIColor.redColor()
    }
    
    // change background color back when user releases touch
    override func collectionView(collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        cell?.backgroundColor = UIColor.greenColor()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SelectGuest" {
            if let cell = sender as? UICollectionViewCell, indexPath = collectionView!.indexPathForCell(cell) {
                let indeks = indexPath.row
                selectedGuest = datas[indeks].name
            }
        }
    }

}
