//
//  MasukViewController.swift
//  Suitmedia Test
//
//  Created by Bungkhus on 8/4/16.
//  Copyright © 2016 Bungkhus. All rights reserved.
//

import UIKit

class MasukViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let strURL = "http://dry-sierra-6832.herokuapp.com/api/people"
        
        AFWrapper.requestGETURL(strURL, success: {
            (JSONResponse) -> Void in
            print(JSONResponse)
        }) {
            (error) -> Void in
            print(error)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
