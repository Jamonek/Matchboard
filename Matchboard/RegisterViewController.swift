//
//  RegisterViewController.swift
//  Matchboard
//
//  Created by lsecrease on 6/15/15.
//  Copyright (c) 2015 ImagineME. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var navigationLabel: UILabel!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var displayNameTextField: DesignableTextField!
    
    @IBOutlet weak var profilePhotoLabel: UILabel!
    @IBOutlet weak var registerButton: DesignableButton!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    let imagePicker = UIImagePickerController()
    
    var phoneNumber: String
    
    
    required init(coder aDecoder: NSCoder) {
        phoneNumber = ""
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        phoneNumber = ""
        
    }
    
    func step1() {
        phoneNumber = ""
        textLabel.hidden = true
        registerButton.enabled = true
    }
    
    func step2() {
        phoneNumber = phoneNumberTextField.text
        phoneNumberTextField.text = ""
        phoneNumberTextField.placeholder = "1234"
        navigationLabel.text = "Registration Verification"
        textLabel.hidden = false
        displayNameTextField.hidden = true
        profilePhotoLabel.hidden = true
        imageView.hidden = true
        registerButton.enabled = true
        registerButton.setTitle("Finish Registration", forState: .Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backButtonTapped(sender: AnyObject) {
        
        if textLabel.hidden == false {
            step1()
        } else {
        self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func loadImageButtonTapped(sender: AnyObject) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
   
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        
        
        if phoneNumber == "" {
            if count(phoneNumberTextField.text) != 10 {
                showAlert("Phone Login", message: "You must enter a 10-digit US phone number including area code.")
                return step1()
            }
            ProgressHUD.show("Signing in...", interaction: false)
            self.editing = false
            let params = ["phoneNumber" : phoneNumberTextField.text]
            PFCloud.callFunctionInBackground("sendCode", withParameters: params) {
                (response: AnyObject?, error: NSError?) -> Void in
                self.editing = true
                if let error = error {
                    var description = error.description
                    if count(description) == 0 {
                        description = "There was a problem with the service.\nTry again later."
                    } else if let message = error.userInfo?["error"] as? String {
                        description = message
                    }
                    self.showAlert("Login Error", message: description)
                    return self.step1()
                }
                ProgressHUD.showSuccess("Code Sent")
                return self.step2()
            }
        } else  {
            if let text = phoneNumberTextField?.text {
                if let code = text.toInt() {
                if count(text) == 4 {
                    return doLogin(phoneNumber, code: code)
                }
            }
            
            showAlert("Code Entry", message: "You must enter the 4 digit code texted to your phone number.")
            }
        }
        
        
    }
    
        

    
    
    
    //*********************Login Function***********************//
    func doLogin(phoneNumber: String, code: Int) {
        self.editing = false
        let params = ["phoneNumber": phoneNumber, "codeEntry": code] as [NSObject:AnyObject]
        PFCloud.callFunctionInBackground("logIn", withParameters: params) {
            (response: AnyObject?, error: NSError?) -> Void in
            if let description = error?.description {
                self.editing = true
                return self.showAlert("Login Error", message: description)
            }
            if let token = response as? String {
                PFUser.becomeInBackground(token) { (user: PFUser?, error: NSError?) -> Void in
                    if let error = error {
                        self.showAlert("Login Error", message: "Something happened while trying to log in.\nPlease try again.")
                        self.editing = true
                        return self.step1()
                    }
                    //**************Save Photo & Display Name*************//
                    self.savePhoto()
                    self.saveData()
                    self.performSegueWithIdentifier("successSegue", sender: self)
                    //return self.dismissViewControllerAnimated(true, completion: nil)
                }
            } else {
                self.editing = true
                self.showAlert("Login Error", message: "Something went wrong.  Please try again.")
                return self.step1()
            }
        }
    }
    
    
    
    
    override func setEditing(editing: Bool, animated: Bool) {
        registerButton.enabled = editing
        phoneNumberTextField.enabled = editing
        if editing {
            phoneNumberTextField.becomeFirstResponder()
        }
    }
    
    
     //*********************Save Photo***********************//
    func savePhoto() {
        
                var user = PFUser.currentUser()!
               let profilePic = self.imageView.image
               let imageData = UIImagePNGRepresentation(profilePic)
                let profileImage = PFFile(name: "image.png", data: imageData)
                 println("\(profileImage.name)")
                user["profileImage"] = profileImage
        
                user.saveInBackgroundWithBlock({ (success, error) -> Void in
                    if success == false{
                        self.displayAlert("Could not Save User Image", error: "Please try again later")
                    } else {
                        println("ProfileImage has been saved successfully!")
                    }
                })
        
    }
    
    func saveData() {
        var user = PFUser.currentUser()!
        let name = self.displayNameTextField.text
        println("\(name)")
        user["name"] = name
        
        user.saveInBackgroundWithBlock({ (success, error) -> Void in
            if success == false{
                self.displayAlert("Could not Save name", error: "Please try again later")
            } else {
                println("Display Name has been saved successfully!")
            }
        })
    }
    
    
    //**********************UI Alert**********************//
    func showAlert(title: String, message: String) {
        return UIAlertView(title: title, message: message, delegate: nil, cancelButtonTitle: "OK").show()
    }
    
    //**********************Dismisses Keyboard when View Touched*********//
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        view.endEditing(true)
    }
    
    // **************** FUNCTION: Send Error Alert ****************************
    func displayAlert(title: String, error: String) {
        // add alert
        var alert = UIAlertController(title: title, message: error, preferredStyle: UIAlertControllerStyle.Alert)
        // add action to alert
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        //show alert
        self.presentViewController(alert, animated: true, completion: nil)
    }

    
    //***********************UIImagePickerController Delegates***********//
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.contentMode = .ScaleAspectFit
            imageView.image = pickedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }


}

