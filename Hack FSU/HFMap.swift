//
//  HFMap.swift
//  Hack FSU
//
//  Created by Todd Littlejohn on 1/12/16.
//  Copyright © 2016 Todd Littlejohn. All rights reserved.
//

import Foundation
import Parse 

class HFMap {
    private var mapImageData:PFFile!
    private var floor:Int!
    
    init( image: PFFile, floor:Int ) {
        self.mapImageData = image
        self.floor = floor
    }
    
    func getMapImage() -> PFFile {
        return self.mapImageData
    }
    
    func getFloorNumber() -> Int {
        return self.floor
    }
    
}