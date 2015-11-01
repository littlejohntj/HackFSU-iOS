//
//  HFMapViewController.swift
//  Hack FSU
//
//  Created by Todd Littlejohn on 10/23/15.
//  Copyright © 2015 Todd Littlejohn. All rights reserved.
//

import UIKit

class HFMapViewController: UIViewController {

    // MARK: UI Outlets
    @IBOutlet weak var MapView: UIImageView!
    
    @IBOutlet weak var floorSegmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func floorMapSegmentValueChange(sender: AnyObject) {
        setImage()
    }
    
    func setImage() {
        switch(self.floorSegmentControl.selectedSegmentIndex) {
        case 0: self.MapView.image = UIImage(named: "firstFloor")
        case 1: self.MapView.image = UIImage(named: "secondFloor")
        case 2: self.MapView.image = UIImage(named: "thirdFloor")
        default: break
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
