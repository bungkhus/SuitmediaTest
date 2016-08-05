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
    
    var data:Guest?{
        didSet{
            self.setupData()
        }
    }
    
    func setupData(){
        self.guestNameLabel.text = self.data?.name
        self.geustImage.image = UIImage(named: "logo")
    }
}
