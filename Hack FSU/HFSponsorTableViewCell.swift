//
//  HFSponsorTableViewCell.swift
//  Hack FSU
//
//  Created by Todd Littlejohn on 1/4/16.
//  Copyright © 2016 Todd Littlejohn. All rights reserved.
//

import UIKit
import ParseUI

class HFSponsorTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var sponsorBadge: UIView!
    @IBOutlet weak var sponsorImage: PFImageView!
    @IBOutlet weak var sponLabel: UILabel!
    @IBOutlet weak var sponsorLevel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        sponsorImage.layer.cornerRadius = 3.5
        sponsorImage.clipsToBounds = true
        sponsorBadge.layer.cornerRadius = sponsorBadge.bounds.width / 2.0
        sponsorBadge.clipsToBounds = true 
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
