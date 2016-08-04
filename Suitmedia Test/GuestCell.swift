//
//  GuestCell.swift
//  Suitmedia Test
//
//  Created by Bungkhus on 8/3/16.
//  Copyright © 2016 Bungkhus. All rights reserved.
//

import UIKit

class GuestCell: UICollectionViewCell {
    
    @IBOutlet weak var geustImage: UIImageView!
    @IBOutlet weak var guestNameLabel: UILabel!
    
    var data:GuestMappable?{
        didSet{
            self.setupData()
        }
    }
    
    func setupData(){
        
//        if let urlString = self.data?["images"]["standard_resolution"]["url"]{
//            let url = NSURL(string: urlString.stringValue)
//            self.imageView.hnk_setImageFromURL(url!)
//        }
        self.guestNameLabel.text = self.data?.name
        self.geustImage.image = UIImage(named: "logo")
    }
}
