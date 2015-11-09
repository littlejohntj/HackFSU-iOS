//
//  HFMentorViewController.swift
//  Hack FSU
//
//  Created by Todd Littlejohn on 10/23/15.
//  Copyright © 2015 Todd Littlejohn. All rights reserved.
//

import UIKit
import Parse

class HFMentorViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    // MARK: UIOutlets
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var nameImageView:UIImageView!
    @IBOutlet weak var locationImageView:UIImageView!
    
    // MARK: Class Varibles 
    var textViewColor = UIColor._lightGrayColor()

    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextView.layer.borderWidth = 0.5
        descriptionTextView.layer.borderColor = self.textViewColor.CGColor
        descriptionTextView.layer.cornerRadius = 7.5
        
        // Set the alpha of the images to 0
        nameImageView!.alpha = 0
        locationImageView!.alpha = 0
        
        nameTextField.delegate = self // Replace TextField with the name of your textField
        locationTextField.delegate = self
        nameTextField.addTarget(self, action: "nameTextFieldDidEnd:", forControlEvents: UIControlEvents.EditingDidEnd)
        nameTextField.addTarget(self, action: "nameTextFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        locationTextField.addTarget(self, action: "locationTextFieldDidEnd:", forControlEvents: UIControlEvents.EditingDidEnd)
        locationTextField.addTarget(self, action: "locationTextFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
    }
    
    func nameTextFieldDidEnd(textField: UITextField) {
        nameImageView!.alpha = 1
        if nameTextField.text == "" {
            nameImageView!.alpha = 0
        }
    }
    
    func nameTextFieldDidChange(textField: UITextField) {
        if nameTextField.text == "" {
            nameImageView!.alpha = 0
        }
    }
    
    func locationTextFieldDidEnd(textField: UITextField) {
        locationImageView!.alpha = 1
        if locationTextField.text == "" {
            locationImageView!.alpha = 0
        }
    }
    
    func locationTextFieldDidChange(textField: UITextField) {
        if locationTextField.text == "" {
            locationImageView!.alpha = 0
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.descriptionTextView.resignFirstResponder()
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
    
    // Function to switch textFields when tapping return button on keyboard
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let nextTag: NSInteger = textField.tag + 1;
        // Try to find next responder
        if let nextResponder: UIResponder! = textField.superview!.viewWithTag(nextTag){
            if (nextResponder != nil) {
                // Found next responder, so set it.
                nextResponder.becomeFirstResponder()
            }
        }
        else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        return false; // We do not want UITextField to insert line-breaks.
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
        
        let descriptionTextFieldSize:Int = descriptionTextView.text!.characters.count
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
        
        presentAlert("Properly Fill Out Text Field", alertMessage: alertMessage)
        
        return false
    }
    
    func sendHelpRequest() {
        let request = HelpRequest(name: nameTextField.text!, location: locationTextField.text!, description: descriptionTextView.text!)
        
        request.saveInBackgroundWithBlock { (sucess, error) -> Void in
            if sucess {
                self.emptyTextFields()
                self.presentAlert("Help Request Sucessful", alertMessage: "Keep an eye out for your mentor!")
                
            } else {
                self.presentAlert("Help Request Not Sucessful :(", alertMessage: "We couldn't process your help request. Make sure you're connected to wifi and try again. If this problem persists, come to the mentor room!")
            }
        }
    }
    
    func presentAlert(title: String, alertMessage: String) {
        let alertController = UIAlertController(title: title, message:
            alertMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func emptyTextFields() {
        self.nameTextField.text = ""
        self.locationTextField.text = ""
        self.descriptionTextView.text = ""
    }
}
