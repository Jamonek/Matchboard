//
//  CategoryViewController.swift
//  Matchboard
//
//  Created by lsecrease on 7/1/15.
//  Copyright (c) 2015 ImagineME. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CategoryTableViewCellDelegate {

     @IBOutlet var tableView: UITableView!
    //var expandedSections: NSMutableIndexSet! = nil;
    

    var categoryArray: [String] = []
    
    
    //MARK - Data Source
    //Initialize a data source to be ProductLines
    
    lazy var categoryHeaders: [CategoryHeader] = {
        return CategoryHeader.categoryHeaders()
        }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if self.expandedSections == nil{
//            expandedSections = NSMutableIndexSet() as NSMutableIndexSet;
//        }

        tableView.backgroundColor = UIColor.clearColor()

    }

    
    //UITableViewDataSource
    
//    func tableView(tableView:UITableView,canCollapseSection section:NSInteger) -> Bool{
//        if section >= 0{
//            return true;
//        }
//        else{
//            return false;
//        }
//    }
    
    
    
    
    //Title of the Section Headers  DONE
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let categoryHeader = categoryHeaders[section]
        return categoryHeader.name
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCellWithIdentifier("Header") as! CustomHeaderCell
        let categoryHeader = categoryHeaders[section]
        cell.categoryHeaderLabel.text = categoryHeader.name
        return cell
        
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
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
        var cell: CategoryTableViewCell = tableView.dequeueReusableCellWithIdentifier("Category") as! CategoryTableViewCell
        
        let categoryHeader = categoryHeaders[indexPath.section]
        let category = categoryHeader.category[indexPath.row]
        cell.categoryLabel.text = category.title
        cell.checkbox.isChecked = false
        cell.checkbox.tag = indexPath.row
        cell.delegate = self
        cell.checkbox.tableView = self.tableView
        return cell
    }
    
    
    
    
    
//    //??????
//    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
//        var cell: CategoryTableViewCell = tableView.dequeueReusableCellWithIdentifier("Category") as CategoryTableViewCell
//        cell.selectionStyle = UITableViewCellSelectionStyle.None
//        return indexPath == tableView.indexPathForSelectedRow() ? nil : indexPath
//    }
    
    
    //?????????
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Selected")
        var cell: CategoryTableViewCell = tableView.dequeueReusableCellWithIdentifier("Category") as! CategoryTableViewCell
        let categoryHeader = categoryHeaders[indexPath.section]
        let category = categoryHeader.category[indexPath.row]
        cell.checkbox.changeBox()
        println("\(category.title) Selected")
        categoryArray.append(category.title)
        //println(categoryArray)
        //tableView.reloadData()
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
       var cell: CategoryTableViewCell = tableView.dequeueReusableCellWithIdentifier("Category") as! CategoryTableViewCell
        var catArray: [String] = []
        
        if cell.checkbox.isChecked == false {
            catArray.append(cell.categoryLabel.text!)
        }
       
        println("\(cell.categoryArray)")
        println("Delegate implemented")
        
        
        
        
    }
}
