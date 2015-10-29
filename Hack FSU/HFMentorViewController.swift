//
//  HFMentorViewController.swift
//  Hack FSU
//
//  Created by Todd Littlejohn on 10/23/15.
//  Copyright © 2015 Todd Littlejohn. All rights reserved.
//

import UIKit

class HFMentorViewController: UIViewController {

    
    // MARK: UIOutlets
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    // MARK: Class Varibles 
    var textViewColor = UIColor._lightGrayColor()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionTextField.layer.borderWidth = 0.5
        descriptionTextField.layer.borderColor = self.textViewColor.CGColor
        descriptionTextField.layer.cornerRadius = 7.5
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.descriptionTextField.resignFirstResponder()
        self.nameTextField.resignFirstResponder()
        self.locationTextField.resignFirstResponder()
    }
}
