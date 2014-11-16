//
//  ViewController.swift
//  login
//
//  Created by Jon Felske on 2014-11-14.
//  Copyright (c) 2014 @jonfelske. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var spinnerView: UIActivityIndicatorView!
    
   
    
    @IBAction func login(sender: AnyObject) {
        
        spinnerView.startAnimating()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Add an Object
        var testObject = PFObject(className:"TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock {
            (success: Bool!, error: NSError!) -> Void in
            if (success != nil) {
                NSLog("Object created with id: \(testObject.objectId)")
                
            } else {
                NSLog("%@", error)
            }
        }
        
        //Query an Object
        var query = PFQuery(className:"TestObject")
        query.getObjectInBackgroundWithId("i4LZA5Dbb3") {
            (testObject: PFObject!, error: NSError!) -> Void in
            if error == nil {
                NSLog("%@", testObject)
            } else {
                NSLog("%@", error)
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

