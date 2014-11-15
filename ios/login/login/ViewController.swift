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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

