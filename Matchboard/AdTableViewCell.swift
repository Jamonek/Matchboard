//
//  AdTableViewCell.swift
//  Matchboard
//
//  Created by lsecrease on 5/21/15.
//  Copyright (c) 2015 ImagineME. All rights reserved.
//

import UIKit

protocol AdTableViewCellDelegate : class {
    func adTableViewCellDidTouchCategory(cell: AdTableViewCell, sender: AnyObject)
}

class AdTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var adLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var categoryLabel: UIButton!
  
    weak var delegate: AdTableViewCellDelegate?
    
    
    @IBAction func categoryButtonPressed(sender: AnyObject) {
        
        println("Category Button Pressed")
        
        delegate?.adTableViewCellDidTouchCategory(self, sender: sender)
    }
}
