//
//  EventTableViewController.swift
//  Suitmedia Test
//
//  Created by Bungkhus on 8/1/16.
//  Copyright © 2016 Bungkhus. All rights reserved.
//

import UIKit

class EventTableViewController: UITableViewController {

    var events = [
        Event(name:"Birth Day", date: NSDate(), image: "logo"),
        Event(name:"New Year", date: NSDate(), image: "logo"),
        Event(name:"Party", date: NSDate(), image: "logo"),
        Event(name:"Karaoke", date: NSDate(), image: "logo"),
        Event(name:"Fishing", date: NSDate(), image: "logo")
    ]
    
    var selectedEvent:String?
    var selectedDateEvent:NSDate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("EventCell", forIndexPath: indexPath)
            as! EventCell
        
        let event = events[indexPath.row] as Event
        cell.event = event
        selectedEvent = event.name
        selectedDateEvent = event.date

        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveSelectedEvent" {
            if let cell = sender as? UITableViewCell {
                let indexPath = tableView.indexPathForCell(cell)
                if let index = indexPath?.row {
                    selectedEvent = events[index].name
                    selectedDateEvent = events[index].date
                }
            }
        }
    }

}
