//
//  HFSponsorViewController.swift
//  Hack FSU
//
//  Created by Todd Littlejohn on 10/25/15.
//  Copyright © 2015 Todd Littlejohn. All rights reserved.
//

import UIKit

class HFSponsorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Sponsor"
        return cell 
    }
    

    

}
