//
//  Checkbox.swift
//  CheckBox Alternative Swift
//
//  Created by Shweta Choudhary on 5/28/15.
//  Copyright (c) 2015 IBM. All rights reserved.
//

import UIKit

class Checkbox: UIButton {

    //images
    let checkedImage = UIImage(named: "checked_checkbox")
    let uncheckedImage = UIImage(named: "unchecked_checkbox")
    
    //bool property 
    var isChecked:Bool = false{
        didSet{         // Whenever isChecked is updated this didSet will be called
            if isChecked == true{
                self.setImage(checkedImage, forState: .Normal)
            }else{
                self.setImage(uncheckedImage, forState: .Normal)
            }
        }
    }
    
    //Called when the button is clicked
    override func awakeFromNib() {
        self.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        self.isChecked = false
    }
    
    func buttonClicked(sender:UIButton){
        if(sender == self){
            if isChecked == true{
                isChecked = false
            }else
            {
                isChecked = true
            }
        }
    }
    

}
