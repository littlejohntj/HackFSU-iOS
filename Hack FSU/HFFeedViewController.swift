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
    }
    
    override func viewWillLayoutSubviews() {
        checkForContent()
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
            switch(self.feedSegmentControl.selectedSegmentIndex) {
            case 0: if updateFeedArray.count == 0 {
                feedTableView.alpha = 0.0
                tableViewContainerView.glyptodon.show("No Updates. Happy Hacking!")
                
            }   else {
                tableViewContainerView.glyptodon.hide()
                feedTableView.alpha = 1.0
                }
            case 1: if hackerFeedArray.count == 0 {
                feedTableView.alpha = 0.0
                tableViewContainerView.glyptodon.show("No Posts. Happy Hacking!")
            }   else {
                feedTableView.alpha = 0.0
                tableViewContainerView.glyptodon.hide()
                }
            case 2: if twitterFeedArray.count == 0 {
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
