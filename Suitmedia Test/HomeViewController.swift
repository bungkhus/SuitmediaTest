//
//  HomeViewController.swift
//  Suitmedia Test
//
//  Created by Bungkhus on 8/1/16.
//  Copyright © 2016 Bungkhus. All rights reserved.
//

import UIKit
import PKHUD

class HomeViewController: UIViewController {

    @IBOutlet weak var btEvent: UIButton!
    @IBOutlet weak var btGuest: UIButton!
    let dateFormatter = NSDateFormatter()
    
    var event:String? {
        didSet {
            btEvent.setTitle(event, forState: .Normal)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindWithSelectedEvent(segue:UIStoryboardSegue) {
        if let eventViewController = segue.sourceViewController as? EventTableViewController,
            selectedEvent = eventViewController.selectedEvent {
            event = selectedEvent
            dateFormatter.dateFormat = "MMMM"
            let date = dateFormatter.stringFromDate(eventViewController.selectedDateEvent!)
            HUD.flash(.Label(date), delay: 2.0) { _ in
                print(date)
            }
        }
    }
    
    @IBAction func unwindWithSelectedGuest(segue:UIStoryboardSegue) {
        
    }

}
