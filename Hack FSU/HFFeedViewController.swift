//
//  HFFeedViewController.swift
//  Hack FSU
//
//  Created by Todd Littlejohn on 10/22/15.
//  Copyright © 2015 Todd Littlejohn. All rights reserved.
//

import UIKit
import Glyptodon

class HFFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: UI Outlets
    
    @IBOutlet weak var feedTableView: UITableView!

    @IBOutlet weak var feedSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var tableViewContainerView: UIView!
    
    
    // MARK: Class Variables
    var updateFeedArray:[String] = [String]()
    var hackerFeedArray:[String] = [String]()
    var twitterFeedArray:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkForContent()
    }
    
    override func viewWillLayoutSubviews() {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell()
        cell.textLabel?.text = "Label"
        return cell
    }
    
    @IBAction func feedSegControlValueChanged(sender: AnyObject) {
        }
    
    /* checkForContent will check if there is data to be displayed in the view. If not, it will set the correct Glyptodon view. */
    func checkForContent() {
        let update = 0
        let hacker = 1
        let twitter = 2
        
            switch(self.feedSegmentControl.selectedSegmentIndex) {
            case update: if updateFeedArray.count == 0 {
                feedTableView.alpha = 0.0
                tableViewContainerView.glyptodon.show("No Updates. Happy Hacking!")
                
            }   else {
                tableViewContainerView.glyptodon.hide()
                feedTableView.alpha = 1.0
                }
            case hacker: if hackerFeedArray.count == 0 {
                feedTableView.alpha = 0.0
                tableViewContainerView.glyptodon.show("No Posts. Happy Hacking!")
            }   else {
                feedTableView.alpha = 0.0
                tableViewContainerView.glyptodon.hide()
                }
            case twitter: if twitterFeedArray.count == 0 {
                feedTableView.alpha = 0.0
                tableViewContainerView.glyptodon.show("No Tweets Yet. Use the Hashtag: #HackFSU")
            }   else {
                feedTableView.alpha = 0.0
                tableViewContainerView.glyptodon.hide()
                }
            default: break
        } // End of Switch
    }
    
}// End of View Controller Class
