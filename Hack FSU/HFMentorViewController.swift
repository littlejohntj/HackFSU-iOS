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
    
    // Will send help request if all the fields are correctly filled out
    @IBAction func processHelpRequest(sender: AnyObject) {
        if checkFeildsForRequiredLength() {
            sendHelpRequest()
        } else {
            
        }
    }
    
    func checkFeildsForRequiredLength() -> Bool {
        // Maximum text field lengths
        let nameTextFieldMaxSize:Int = 100
        let locationTextFieldMaxSize:Int = 100
        let descriptionTextFieldMaxSize:Int = 2000
        
        let nameTextFieldSize:Int = nameTextField.text!.characters.count
        let nameTextFieldIsCorrectLength:Bool = nameTextFieldSize > 0 && nameTextFieldSize <= nameTextFieldMaxSize
        
        let locationTextFieldSize:Int = locationTextField.text!.characters.count
        let locationTextFieldIsCorrectLength:Bool = locationTextFieldSize > 0 && locationTextFieldSize <= locationTextFieldMaxSize
        
        let descriptionTextFieldSize:Int = descriptionTextField.text!.characters.count
        let descriptionTextFieldIsCorrectLength:Bool = descriptionTextFieldSize > 0 && descriptionTextFieldSize <= descriptionTextFieldMaxSize
        
        var alertMessage:String!
        
        /* Need to add cases to display errors for poorly filled out text fields */
        if nameTextFieldIsCorrectLength && locationTextFieldIsCorrectLength && descriptionTextFieldIsCorrectLength {
            return true
        } else if nameTextFieldIsCorrectLength && locationTextFieldIsCorrectLength {
            // name and location are correct
            alertMessage = "Please add a description of your help request under \(descriptionTextFieldMaxSize) characters."
        } else if nameTextFieldIsCorrectLength && descriptionTextFieldIsCorrectLength {
            // name and description are correct
            alertMessage = "Please specify your location in under \(locationTextFieldMaxSize) characters."
        } else if locationTextFieldIsCorrectLength && descriptionTextFieldIsCorrectLength {
            // location and description are correct
            alertMessage = "Please fill in your name in under \(nameTextFieldMaxSize) characters."
        } else {
            // multiple feilds are not filled out correctly
            alertMessage = "There are multiple text fields not filled out properly."
        }
        
        let alertController = UIAlertController(title: "Properly Fill Out Text Field", message:
            alertMessage, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
        return false
    }
    
    func sendHelpRequest() {
        print("woo")
    }
}
