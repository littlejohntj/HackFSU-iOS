//
//  HFSponsorViewController.swift
//  Hack FSU
//
//  Created by Todd Littlejohn on 10/25/15.
//  Copyright © 2015 Todd Littlejohn. All rights reserved.
//

import UIKit
import FlatUIKit
import Parse
import Glyptodon
import ParseUI


class HFSponsorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var sponsorFeedArray:[HFSponsor] = [HFSponsor]()
    @IBOutlet weak var sponsorTableView: UITableView!
    @IBOutlet var sponsorContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkForContent()
        getSponsorsFromParse()
        sponsorTableView.setContentOffset(CGPointZero, animated: false)
        sponsorTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        sponsorTableView.backgroundColor = UIColor.colorFromHex(0xEDECF3)
        // Setting Navigation Bar Color
        self.navigationController?.navigationBar.barTintColor = UIColor._hackRed()
        self.navigationController?.navigationBar.tintColor = .whiteColor()
        
        // Setting Navigation Bar Title
        self.navigationItem.title = "SPONSORS"
        let attributesDictionary = [NSFontAttributeName: UIFont(name: "UniSansHeavyCAPS", size: 25)!, NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController!.navigationBar.titleTextAttributes = attributesDictionary
        
        // self.sponsorTableView.tableFooterView = UIView()
        
        self.sponsorTableView.rowHeight = UITableViewAutomaticDimension
        self.sponsorTableView.estimatedRowHeight = 44.0

    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sponsorFeedArray.count
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:HFSponsorTableViewCell = tableView.dequeueReusableCellWithIdentifier("sponsor") as! HFSponsorTableViewCell
        let sponsor:HFSponsor = sponsorFeedArray[indexPath.section]
        
        
        cell.sponsorImage.file = sponsor.getSponsorImage()
        cell.sponsorImage.loadInBackground()
        cell.sponLabel.text = sponsor.getSponsorName()
        cell.configureFlatCellWithColor(UIColor.whiteColor(), selectedColor: UIColor.whiteColor(), roundingCorners: .AllCorners)
        cell.cornerRadius = 3.5
        cell.backgroundColor = UIColor.colorFromHex(0xEDECF3)
//        cell.separatorHeight = 10.0
        return cell
    }
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        let aspectRatio:CGFloat = 0.4
//        let width = UIScreen.mainScreen().bounds.width - 16.0
//        let height = width * aspectRatio
//        return height
//    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 6.0
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 6.5))
        footerView.backgroundColor = UIColor.colorFromHex(0xEDECF3)
        
        return footerView
    }
    
    func checkForContent() {
        if sponsorFeedArray.count == 0 {
            sponsorTableView.alpha = 0.0
            sponsorContainerView.glyptodon.show("Getting Sponsors. Please Wait.")
        } else {
            sponsorContainerView.glyptodon.hide()
            sponsorTableView.alpha = 1.0
        }
    }

    
    func getSponsorsFromParse() {
        
        
        var sponsorArray:[HFSponsor] = [HFSponsor]()
        
        let query = PFQuery(className: "Sponsor").orderByDescending("level")
        
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if let _ = objects {
                
                self.sponsorFeedArray.removeAll()
                
                for sponsor in objects! {
                    let newSponsorName = sponsor.objectForKey("name") as! String
                    let newSponsorImage = sponsor.objectForKey("image") as? PFFile
                    let newSponsorLevel = sponsor.objectForKey("level") as! Int
                    
                    if newSponsorLevel != 1 {
                        let newSponsor = HFSponsor(name: newSponsorName, image: newSponsorImage!, level: newSponsorLevel)
                        sponsorArray.append(newSponsor)
                    }
                }
                
                self.sponsorFeedArray = sponsorArray
                self.sponsorTableView.reloadData()
                self.checkForContent()
            } else {
                print(error)
            }
        }
    }

}

    


