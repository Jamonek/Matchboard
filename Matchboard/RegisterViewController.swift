//
//  RegisterViewController.swift
//  Matchboard
//
//  Created by lsecrease on 6/15/15.
//  Copyright (c) 2015 ImagineME. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var phoneNumberTextField: DesignableTextField!
    @IBOutlet weak var displayNameTextField: DesignableTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backButtonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        view.endEditing(true)
    }


}
