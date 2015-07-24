//
//  Checkbox.swift
//  CheckBox Alternative Swift
//

//

import UIKit

class Checkbox: UIButton {
    var tableView : UITableView?
    //images
    let checkedImage = UIImage(named: "checked_checkbox")
    let uncheckedImage = UIImage(named: "unchecked_checkbox")
    //bool property
    var isChecked:Bool = false{
        didSet{         // Whenever isChecked is updated this didSet will be called
            println("didSet of checkbox called | checkbox status: \(isChecked) | tag \(self.tag)")
            if isChecked == true{
                println("Setting image, true")
                setImage(checkedImage, forState: .Normal)
            }else{
                println("Setting image, false")
                self.setImage(uncheckedImage, forState: .Normal)
            }
        }
    }
    
    //Called when the button is clicked
    override func awakeFromNib() {
        self.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        self.isChecked = false
        println("Checkbox Button clicked")
    }
    
    func changeBox() {
        println("changebox: status \(isChecked)")
        if isChecked == true{
            println("Setting isChecked to false")
            isChecked = false
        } else {
            println("Setting isChecked to true")
            isChecked = true
        }
        
        self.tableView?.reloadData()
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
