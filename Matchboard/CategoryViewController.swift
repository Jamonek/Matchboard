//
//  CategoryViewController.swift
//  Matchboard
//
//  Created by lsecrease on 7/1/15.
//  Copyright (c) 2015 ImagineME. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CategoryTableViewCellDelegate {

     @IBOutlet weak var tableView: UITableView!
    
    
    //MARK - Data Source
    //Initialize a data source to be ProductLines
    lazy var categoryHeaders: [CategoryHeader] = {
        return CategoryHeader.categoryHeaders()
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = UIColor.clearColor()
        
    }

    
    //UITableViewDataSource
    
    //Title of the Section Headers  DONE
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let categoryHeader = categoryHeaders[section]
        return categoryHeader.name
    }
    
    //Number of Sections in the Table View DONE
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return categoryHeaders.count
    }
    
    
    //Number of Rows in each section DONE
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let categoryHeader = categoryHeaders[section]
        return categoryHeader.category.count
        
    }
    //What goes in each Table View Cell  DONE
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: CategoryTableViewCell = tableView.dequeueReusableCellWithIdentifier("Category") as CategoryTableViewCell
        
        let categoryHeader = categoryHeaders[indexPath.section]
        let category = categoryHeader.category[indexPath.row]
        cell.categoryLabel?.text = category.title
        
    
        
        cell.delegate = self
        
        return cell
    }
    
    //Display of the cells DONE
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        var backView = UIImageView(frame: CGRectMake(0, 0, cell.frame.width, cell.frame.height))
        backView.backgroundColor = UIColor.clearColor()
        cell.backgroundView = backView
    }
    
    //Back Button
    @IBAction func backButtonTapped(sender: AnyObject) {
        //dismissViewControllerAnimated(true, completion: nil)
    }
    
    //Done Button
    @IBAction func doneButtonTapped(sender: AnyObject) {
    }
    
    func categoryTableViewCellDidTouchCheckbox(cell: CategoryTableViewCell, sender: AnyObject) {
        // TODO: Implement Checkbox
        
        
        
        
    }
}
