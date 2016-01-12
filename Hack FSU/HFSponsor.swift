//
//  HFSponsor.swift
//  Hack FSU
//
//  Created by Todd Littlejohn on 1/4/16.
//  Copyright © 2016 Todd Littlejohn. All rights reserved.
//

import Foundation
import Parse

class HFSponsor {
    private var sponsorName:String!
    private var sponsorImageData:PFFile!
    private var sponsorLevel:Int!
    
    
    init(name: String, image: PFFile, level:Int ) {
        sponsorName = name
        sponsorImageData = image
        sponsorLevel = level
    }
    
    init(name: String) {
        sponsorName = name
    }
    
    func getSponsorName() -> String {
        return self.sponsorName
    }
    
    func getSponsorImage() -> PFFile {
        return self.sponsorImageData!
   }
    
    func getSponsorLevel() -> Int {
        return self.sponsorLevel
    }
}