//
//  GuestCollectionViewController.swift
//  Suitmedia Test
//
//  Created by Bungkhus on 8/3/16.
//  Copyright © 2016 Bungkhus. All rights reserved.
//

import UIKit
import PKHUD

class GuestCollectionViewController: UICollectionViewController {

    private let reuseIdentifier = "GuestCell"
    var datas = [Guest]()
    var selectedGuest:String?
    var selectedBirthdateGuest:NSDate?
    let interactor = GuestInteractor()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchData()
    }
    
    private func fetchData(){
        print("fetching...")
        HUD.show(.Progress)
        datas = interactor.load()
        interactor.refresh({ guests in
            self.datas = guests
            self.collectionView?.reloadData()
            print("fetch success")
            HUD.hide()
        }, failure: { error in
            HUD.flash(.Label(self.interactor.msg), delay: 2.0) { _ in
                print(error)
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.datas.count
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
                selectedGuest = self.datas[indeks].name
            }
        }
    }

}
