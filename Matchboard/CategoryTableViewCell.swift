//
//  CategoryTableViewCell.swift
//  Matchboard
//
//  Created by lsecrease on 7/1/15.
//  Copyright (c) 2015 ImagineME. All rights reserved.
//

import UIKit

protocol CategoryTableViewCellDelegate : class {
    func categoryTableViewCellDidTouchCheckbox(cell: CategoryTableViewCell, sender: AnyObject)
}

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet var checkbox: Checkbox!
    @IBOutlet var categoryLabel: UILabel!
   
    
    weak var delegate: CategoryTableViewCellDelegate?
    
    
    var categoryArray: [String] = []
    var filter: [String] = []
     
    @IBAction func checkboxTapped(sender: UIButton) {
        

        if self.checkbox.isChecked == false {
            println("Checkbox checked")
            println("\(categoryLabel.text!)")
            //categoryArray.append("\(categoryLabel.text!)")
            //println(categoryArray)
            //delegate?.categoryTableViewCellDidTouchCheckbox(self, sender: sender)
        } else {
            println("Checkbox unchecked")
            println("\(categoryLabel.text!)")
            //var categoryChosen = "\(categoryLabel.text!)"
            //let filter = categoryArray.filter() { $0 != categoryChosen }
            //categoryArray = filter
            //println(categoryArray)
            //delegate?.categoryTableViewCellDidTouchCheckbox(self, sender: sender)
        }
        
      
        
        delegate?.categoryTableViewCellDidTouchCheckbox(self, sender: sender)
    }

}
