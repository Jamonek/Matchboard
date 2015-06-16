//
//  AdProfileViewController.swift
//  Matchboard
//
//  Created by lsecrease on 5/26/15.
//  Copyright (c) 2015 ImagineME. All rights reserved.
//

import UIKit

class AdProfileViewController: UIViewController {
    
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileFirstName: UILabel!
    @IBOutlet weak var sex: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var lookingForAd: AutoTextView!
    @IBOutlet weak var aboutMeText: AutoTextView!
    
    
    
    var adProfileModel: AdModel!
    
    var mainVC: ViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.profileName.text = "\(adProfileModel.name)'s Profile"
        self.profileImage.image = adProfileModel.profileImage
        self.profileFirstName.text = adProfileModel.name
        self.lookingForAd.text = adProfileModel.ad
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonTouched(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

   

}
