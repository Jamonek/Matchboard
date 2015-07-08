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

    @IBOutlet weak var checkbox: Checkbox!
    @IBOutlet weak var categoryLabel: UILabel!
   
    
    weak var delegate: CategoryTableViewCellDelegate?
    
    
    

    @IBAction func checkboxTapped(sender: AnyObject) {
        
        
        if self.checkbox.isChecked == false {
            println("Checkbox checked")
        } else {
            println("Checkbox unchecked")
        }
        delegate?.categoryTableViewCellDidTouchCheckbox(self, sender: sender)
    }

}
