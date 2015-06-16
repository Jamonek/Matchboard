//
//  WelcomeViewController.swift
//  Matchboard
//
//  Created by lsecrease on 6/15/15.
//  Copyright (c) 2015 ImagineME. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var adTextView: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func nextButtonTapped(sender: AnyObject) {
    }
   
    @IBAction func skipButtonTapped(sender: AnyObject) {
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        view.endEditing(true)
    }

}
