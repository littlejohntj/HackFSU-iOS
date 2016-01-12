//
//  HelpRequest.swift
//  Hack FSU
//
//  Created by Todd Littlejohn on 11/2/15.
//  Copyright © 2015 Todd Littlejohn. All rights reserved.
//

import Foundation
import Parse

class HelpRequest: PFObject, PFSubclassing {
    
    static func parseClassName() -> String {
        return "HelpRequest"
    }
    
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    override init() {
        super.init()
    }
    
    init(name: String, location: String, description: String) {
        super.init()
        self["name"] = name
        self["location"] = location
        self["description"] = description
    }
}