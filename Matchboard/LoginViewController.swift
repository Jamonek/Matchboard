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
    
//    func processFacebook(user: PFUser, userData: [String: AnyObject]) {
//        let facebookUserId = userData["id"] as String
//        var link = "http://graph.facebook.com/\(facebookUserId)/picture"
//        let url = NSURL(string: link)
//        var request = NSURLRequest(URL: url!)
//        let params = ["height": "200", "width": "200", "type": "square"]
//        Alamofire.request(.GET, link, parameters: params).response() {
//            (request, response, data, error) in
//            
//            if error == nil {
//                var image = UIImage(data: data! as NSData)!
//                
//                if image.size.width > 280 {
//                    image = Images.resizeImage(image, width: 280, height: 280)!
//                }
//                var filePicture = PFFile(name: "picture.jpg", data: UIImageJPEGRepresentation(image, 0.6))
//                filePicture.saveInBackgroundWithBlock({ (success: Bool, error: NSError!) -> Void in
//                    if error != nil {
//                        ProgressHUD.showError("Error saving photo")
//                    }
//                })
//                
//                if image.size.width > 60 {
//                    image = Images.resizeImage(image, width: 60, height: 60)!
//                }
//                var fileThumbnail = PFFile(name: "thumbnail.jpg", data: UIImageJPEGRepresentation(image, 0.6))
//                fileThumbnail.saveInBackgroundWithBlock({ (success: Bool, error: NSError!) -> Void in
//                    if error != nil {
//                        ProgressHUD.showError("Error saving thumbnail")
//                    }
//                })
//                
//                user[PF_USER_EMAILCOPY] = userData["email"]
//                user[PF_USER_FULLNAME] = userData["name"]
//                user[PF_USER_FULLNAME_LOWER] = (userData["name"] as String).lowercaseString
//                user[PF_USER_FACEBOOKID] = userData["id"]
//                user[PF_USER_PICTURE] = filePicture
//                user[PF_USER_THUMBNAIL] = fileThumbnail
//                user.saveInBackgroundWithBlock({ (succeeded: Bool, error: NSError!) -> Void in
//                    if error == nil {
//                        self.userLoggedIn(user)
//                    } else {
//                        PFUser.logOut()
//                        if let info = error!.userInfo {
//                            ProgressHUD.showError("Login error")
//                            println(info["error"] as String)
//                        }
//                    }
//                })
//            } else {
//                PFUser.logOut()
//                if let info = error!.userInfo {
//                    ProgressHUD.showError("Failed to fetch Facebook photo")
//                    println(info["error"] as String)
//                }
//            }
//        }
//    }

    override func viewDidAppear(animated: Bool) {
        if PFUser.currentUser() != nil {
            println("User loggined in")
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }

}


