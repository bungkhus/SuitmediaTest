//
//  GuestCollectionViewController.swift
//  Suitmedia Test
//
//  Created by Bungkhus on 8/3/16.
//  Copyright © 2016 Bungkhus. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire

class GuestCollectionViewController: UICollectionViewController {

    private let reuseIdentifier = "GuestCell"
//    var guests = [
//        Guest(name:"Bill Evans", birthdate: NSDate(), image:"logo"),
//        Guest(name: "Oscar Peterson", birthdate: NSDate(), image: "logo"),
//        Guest(name: "Dave Brubeck", birthdate: NSDate(), image: "logo") ]
    var datas = [GuestMappable]()
    var selectedGuest:String?
    var selectedBirthdateGuest:NSDate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let strURL = "http://dry-sierra-6832.herokuapp.com/api/people"
        Alamofire.request(.GET, strURL).responseArray { (response: Response<[GuestMappable], NSError>) in

            let forecastArray = response.result.value
            if forecastArray != nil{
                self.datas = forecastArray!
                self.collectionView!.reloadData()
            }
            
//            if let forecastArray = forecastArray {
//                for forecast in forecastArray {
//                    print(forecast.id)
//                    print(forecast.name)
//                }
//            }
        }
//        AFWrapper.requestGETURL(strURL, success: {
//            (JSONResponse) -> Void in
////            print(JSONResponse)
//            for data in JSONResponse {
//                let guest = Guest.initialData(data.1)
//                print(guest)
//            }
//        }) {
//            (error) -> Void in
//            print(error)
//        }
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
        
//        let guest = guests[indexPath.row] as Guest
//        cell.guestNameLabel.text = guest.name
//        cell.geustImage.image = UIImage(named: "logo")
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
