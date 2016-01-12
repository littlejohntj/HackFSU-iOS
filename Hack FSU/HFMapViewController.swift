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
import Agrume
import ParseUI

class HFMapViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var floorTableView: UITableView!
    @IBOutlet var mapTableViewContainerView: UIView!
    
    
    
    
    
    // MARK: Class Variables
    
    var mapArray:[HFMap] = [HFMap]()
    // var feedSegmentControl:UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkForContent()
        getSponsorsFromParse()
        floorTableView.setContentOffset(CGPointZero, animated: false)
        self.floorTableView.rowHeight = UITableViewAutomaticDimension
        self.floorTableView.estimatedRowHeight = 44.0
        
        floorTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        floorTableView.backgroundColor = UIColor.colorFromHex(0xEDECF3)
        
        // Setting Navigation Bar Color
        self.navigationController?.navigationBar.barTintColor = UIColor._hackRed()
        self.navigationController?.navigationBar.tintColor = .whiteColor()
        
        // Setting Navigation Bar Title
        self.navigationItem.title = "VENUE MAP"
        let attributesDictionary = [NSFontAttributeName: UIFont(name: "UniSansHeavyCAPS", size: 25)!, NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController!.navigationBar.titleTextAttributes = attributesDictionary
    }
    
    override func viewDidAppear(animated: Bool) {
        checkForContent()
        getSponsorsFromParse()
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 6.0 
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return mapArray.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print(indexPath.section)
        let cell:HFMapTableViewCell = tableView.dequeueReusableCellWithIdentifier("map") as! HFMapTableViewCell
        let map = mapArray[indexPath.section]
        cell.mapImage.file = map.getMapImage()
        cell.mapImage.loadInBackground()
        cell.mapImage.contentMode = .ScaleAspectFit
        cell.selectionStyle = .None
        cell.configureFlatCellWithColor(UIColor.whiteColor(), selectedColor: UIColor.whiteColor(), roundingCorners: .AllCorners)
        cell.cornerRadius = 3.5
        cell.backgroundColor = UIColor.colorFromHex(0xEDECF3)
        cell.separatorHeight = 10.0
        return cell
    }
    
    func checkForContent() {
        if mapArray.count == 0 {
            floorTableView.alpha = 0.0
            mapTableViewContainerView.glyptodon.show("Getting Maps. Please Wait.")
        } else {
            mapTableViewContainerView.glyptodon.hide()
            floorTableView.alpha = 1.0
        }
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 6.5))
        footerView.backgroundColor = UIColor.colorFromHex(0xEDECF3)
        
        return footerView
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        let map = mapArray[indexPath.section]
        map.getMapImage().getDataInBackgroundWithBlock { (imageData, error) -> Void in
            let newMap = UIImage(data: imageData!)
            let agrume = Agrume(image: newMap!)
            agrume.showFrom(self)
        }

    }
    
    func getSponsorsFromParse() {
        
        var tempMapArray:[HFMap] = [HFMap]()
        
        let query = PFQuery(className: "MapItem").orderByAscending("floor")
        
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if let _ = objects {
                
                self.mapArray.removeAll()
                
                for map in objects! {
                    
                    let newMapImage = map.objectForKey("image") as? PFFile
                    let newMapFloor = map.objectForKey("floor") as! Int
                    let newMap = HFMap(image: newMapImage!, floor: newMapFloor)
                    tempMapArray.append(newMap)
                }
                
                self.mapArray = tempMapArray
                self.floorTableView.reloadData()
                self.checkForContent()
            } else {
                print(error)
            }
        }
    }
        
}
    

