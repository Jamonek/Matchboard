//
//  ViewController.swift
//  Matchboard
//
//  Created by lsecrease on 3/29/15.
//  Copyright (c) 2015 ImagineME. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdTableViewCellDelegate{


    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBox: UISearchBar!
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    @IBOutlet weak var favoritesView: UIView!
    @IBOutlet weak var messagesView: UIView!
    @IBOutlet weak var categoriesView: UIView!
    @IBOutlet weak var settingsView: UIView!
   
    
    
    var adArray: [AdModel] = []
    
    let transitionManager = TransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PFUser.currentUser()
        
        
        
//        session.saveInBackgroundWithBlock {
//            (success: Bool, error: NSError?) -> Void in
//            if (success) {
//                println("Success")
//            } else {
//                println("Error Occured")
//                PFUser.logOut()
//                self.performSegueWithIdentifier("login", sender: self)
//            }
       //}
        
            
        
        
        //PFUser.logOut()
//       var gameScore = PFObject(className:"TestingMatchBoard")
//        gameScore["votes"] = 1337
//        gameScore["playerName"] = "Chris Moore"
//        gameScore["cheatMode"] = false
//        gameScore.saveInBackgroundWithBlock {
//            (success: Bool, error: NSError?) -> Void in
//            if (success) {
//                println("Saved Successfully")
//            } else {
//                println("Problem Occurred")
//                self.performSegueWithIdentifier("login", sender: self)
//            }
//        }
       
        
        
        
        
        
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.Default, animated: true)
        
        
       //Segment Control Appearance
        
        mySegmentedControl.setDividerImage(UIImage(named: "SegCtrl-noneselected"), forLeftSegmentState: UIControlState.Normal, rightSegmentState: UIControlState.Normal, barMetrics: UIBarMetrics.Default)
        mySegmentedControl.setDividerImage(UIImage(named: "SegCtrl-noneselected"), forLeftSegmentState: UIControlState.Selected, rightSegmentState: UIControlState.Normal, barMetrics: UIBarMetrics.Default)
        mySegmentedControl.setDividerImage(UIImage(named: "SegCtrl-noneselected"), forLeftSegmentState: UIControlState.Normal, rightSegmentState: UIControlState.Selected, barMetrics: UIBarMetrics.Default)
        
        mySegmentedControl.setBackgroundImage(UIImage(named: "SegCtrl-selected"), forState: UIControlState.Selected, barMetrics: UIBarMetrics.Default)
        mySegmentedControl.setBackgroundImage(UIImage(named: "SegCtrl-normal"), forState: UIControlState.Normal, barMetrics: UIBarMetrics.Default)
        
        var attr = NSDictionary(object: UIFont(name: "Avenir Next", size: 12.0)!, forKey: NSFontAttributeName)
        mySegmentedControl.setTitleTextAttributes(attr, forState: .Normal)
        
        
        tableView.backgroundColor = UIColor.clearColor()
        searchBox.backgroundColor = UIColor.clearColor()
        
        searchBox.setImage(UIImage(named: "SearchIcon"), forSearchBarIcon: UISearchBarIcon.Search, state: UIControlState.Normal)
        
        
        let ad1 = AdModel(profileImage: UIImage(named: "chris"), name: "Jesse", ad: "Looking for another gamer!", distance: "10 miles", category: "Gaming", fave: false)
        let ad2 = AdModel(profileImage: UIImage(named: "paul"), name: "Paul", ad: "Need a donor for church clothes.", distance: "12 miles", category: "Community", fave: false)
        let ad3 = AdModel(profileImage: UIImage(named: "Dallas"), name: "Dallas", ad: "Looking for more hackers.", distance: "15 miles", category: "Computer", fave: false)
        
       adArray = [ad1, ad2, ad3, AdModel(profileImage: UIImage(named: "Profile.png"), name: "Lawrence", ad: "Testing", distance: "10 mile", category: "Paid Service", fave: false)]
      
        self.tableView.reloadData()
        
        println("\(adArray.count)")
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Check to see if User is logged in; If not, head over to login
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
        if (PFUser.currentUser() == nil) {
            
            self.performSegueWithIdentifier("login", sender: self)
            
        } else if (PFUser.currentUser() != nil) {
        
            self.storyboard?.instantiateViewControllerWithIdentifier("ViewController")
        }
        
//        var session = PFSession()
//        if (session.sessionToken == nil) {
//            println("Error Occured")
//            PFUser.logOut()
//            self.performSegueWithIdentifier("login", sender: self)
//        }

    
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showProfile" {
            let adVC: AdProfileViewController = segue.destinationViewController as AdProfileViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            let thisAd = adArray[indexPath!.row]
            adVC.adProfileModel = thisAd
            adVC.mainVC = self
            adVC.transitioningDelegate = transitionManager
            
        }
    }

    @IBAction func mySegmentedControlAction(sender: AnyObject) {
        if(mySegmentedControl.selectedSegmentIndex == 0)
        {
            println("Fave Segment Selected");
            favoritesView.hidden = false
            messagesView.hidden = true
            categoriesView.hidden = true
            settingsView.hidden = true
            
            
        }
        else if(mySegmentedControl.selectedSegmentIndex == 1)
        {
            println("Messages Segment Selected");
            messagesView.hidden = false
            favoritesView.hidden = true
            categoriesView.hidden = true
            settingsView.hidden = true
        }
        else if(mySegmentedControl.selectedSegmentIndex == 2)
        {
            println("Home Segment Selected");
            favoritesView.hidden = true
            messagesView.hidden = true
            categoriesView.hidden = true
            settingsView.hidden = true
            
        }
        else if(mySegmentedControl.selectedSegmentIndex == 3)
        {
            println("Categories Segment Selected")
            categoriesView.hidden = false
            favoritesView.hidden = true
            messagesView.hidden = true
            settingsView.hidden = true
        }
        else if(mySegmentedControl.selectedSegmentIndex == 4)
        {
            println("Settings Segment Selected")
            settingsView.hidden = false
            favoritesView.hidden = true
            messagesView.hidden = true
            categoriesView.hidden = true
            
        }
    }
    
    //UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adArray.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let thisAd = adArray[indexPath.row]
        
        var cell: AdTableViewCell = tableView.dequeueReusableCellWithIdentifier("AdCell") as AdTableViewCell
        cell.backgroundColor = UIColor.clearColor()
        
        cell.profileImageView.image = thisAd.profileImage
        cell.nameLabel.text = thisAd.name
        cell.questionLabel.text = "What are you looking for?"
        cell.adLabel.text = thisAd.ad
        cell.distanceLabel.text = thisAd.distance
        cell.categoryLabel.setTitle(thisAd.category, forState: UIControlState.Normal)
        
        //cell.profileImageView.image = UIImage(named: "profile1")
        //cell.nameLabel.text = "Lawrence"
        //cell.questionLabel.text = "What are you looking for?"
        //cell.adLabel.text = "Looking for help moving next week!"
        //cell.distanceLabel.text = "10 miles"
       // cell.categoryLabel.setTitle("Paid Service", forState: UIControlState.Normal)
        
        cell.delegate = self
        
        return cell
    }
        
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        var imageView = UIImageView(frame: CGRectMake(0, 0, cell.frame.width, cell.frame.height))
        let image = UIImage(named: "BkgrdBlur")
        imageView.image = image
        
        if indexPath.row % 2 != 0 {
            cell.backgroundView = UIView()
            cell.backgroundView?.addSubview(imageView)
        }

    }
    
        
    


    //UITableViewDelagate
   func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
         performSegueWithIdentifier("showProfile", sender: self)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }

    func adTableViewCellDidTouchCategory(cell: AdTableViewCell, sender: AnyObject) {
        // TODO: Implement Categories
    }
    
 


}

