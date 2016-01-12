//
//  HFMapViewController.swift
//  Hack FSU
//
//  Created by Todd Littlejohn on 10/23/15.
//  Copyright © 2015 Todd Littlejohn. All rights reserved.
//

import UIKit
import FlatUIKit
import Parse

class HFMapViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var floorTableView: UITableView!
    
    @IBOutlet var mapTableViewContainerView: UIView!
    // MARK: Class Variables
    
    var mapArray:[String] = ["firstFloor", "secondFloor", "thirdFloor"]
    // var feedSegmentControl:UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        floorTableView.setContentOffset(CGPointZero, animated: false)

        self.floorTableView.rowHeight = UITableViewAutomaticDimension
        self.floorTableView.estimatedRowHeight = 44.0
        
        floorTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        // Setting Navigation Bar Color
        self.navigationController?.navigationBar.barTintColor = UIColor._hackRed()
        self.navigationController?.navigationBar.tintColor = .whiteColor()
        
        // Setting Navigation Bar Title
        self.navigationItem.title = "VENUE MAP"
        let attributesDictionary = [NSFontAttributeName: UIFont(name: "UniSansHeavyCAPS", size: 25)!, NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController!.navigationBar.titleTextAttributes = attributesDictionary
        
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200.0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:HFMapTableViewCell = tableView.dequeueReusableCellWithIdentifier("HFMapTableViewCell") as! HFMapTableViewCell
        let map = mapArray[indexPath.section]
        cell.mapImage.image = UIImage(named: map)
        cell.mapImage.contentMode = .ScaleAspectFit
        cell.backgroundColor = UIColor.colorFromHex(0xEDECF3)
        return cell

    }
    
}
