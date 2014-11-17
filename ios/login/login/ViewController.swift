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
        
        // Set permissions required from the facebook user account
       // NSArray *permissionsArray = @[ @"user_about_me", @"user_relationships", @"user_birthday", @"user_location"];
        let permissions = ["user_about_me", "user_likes", "user_birthday", "user_location", "user_relationships"]
        
        PFFacebookUtils.logInWithPermissions(permissions, {
            (user: PFUser!, error: NSError!) -> Void in
            if user == nil {
                NSLog("Uh oh. The user cancelled the Facebook login.")
                self.stopSpinner()
            } else if user.isNew {
                NSLog("User signed up and logged in through Facebook!")
                 self.stopSpinner()
            } else {
                NSLog("User logged in through Facebook!")
                self.stopSpinner()
                 self.performSegueWithIdentifier("loggedIn", sender: nil)
            }
        })
        
        
    }
    
    func stopSpinner(){
        
        spinnerView.stopAnimating()
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

