//
//  LoginViewController.swift
//  Matchboard
//
//  Created by lsecrease on 6/4/15.
//  Copyright (c) 2015 ImagineME. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

   
    @IBOutlet weak var loginView: DesignableView!
    
    @IBOutlet weak var phoneNumberButton: SpringButton!
    
    @IBOutlet weak var facebookButton: SpringButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func phoneRegisterButtonTapped(sender: SpringButton) {
        
        println("Phone Number Button Tapped")
        phoneNumberButton.animation = "pop"
        phoneNumberButton.animate()
        self.performSegueWithIdentifier("phoneSegue", sender: self)
    }
    
    @IBAction func facebookRegisterButtonTapped(sender: SpringButton) {
        
        println("Facebook Button Tapped")
        facebookButton.animation = "pop"
        facebookButton.animate()
        ProgressHUD.show("Signing in...", interaction: false)
        var permissions = [ "public_profile", "email", "user_friends" ]
        
        
        
        PFFacebookUtils.logInInBackgroundWithReadPermissions(permissions,  block: {  (user: PFUser?, error: NSError?) -> Void in
            if let user = user {
                if user.isNew {
                    println("User signed up and logged in through Facebook!")
                    self.performSegueWithIdentifier("welcomeSegue", sender: self)

                } else {
                    println("User logged in through Facebook!")
                    self.userLoggedIn(user)
                }
            } else {
                println("Uh oh. The user cancelled the Facebook login.")
                ProgressHUD.dismiss()
            }
        })
    }
    
    func userLoggedIn(user: PFUser) {
        //PushNotication.parsePushUserAssign()
        ProgressHUD.showSuccess("Welcome Back!")
        self.dismissViewControllerAnimated(true, completion: nil)
        //performSegueWithIdentifier("dismissView", sender: self)
        
        
    }
    

    override func viewDidAppear(animated: Bool) {
        if PFUser.currentUser() != nil {
            println("User loggined in")
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }

}


