//
//  EventCell.swift
//  Suitmedia Test
//
//  Created by Bungkhus on 8/1/16.
//  Copyright © 2016 Bungkhus. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imageImg: UIImageView!
    let dateFormatter = NSDateFormatter()
    
    var event: Event! {
        didSet {
            dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
            nameLabel.text = event.name
            dateLabel.text = dateFormatter.stringFromDate(event.date!)
            imageImg.image = UIImage(named: event.image!)
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageImg.layer.cornerRadius = imageImg.frame.size.width / 2
        imageImg.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
