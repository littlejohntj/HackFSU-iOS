//
//  HFUpdate.swift
//  Hack FSU
//
//  Created by Todd Littlejohn on 11/19/15.
//  Copyright © 2015 Todd Littlejohn. All rights reserved.
//

import Foundation
import Parse

class HFUpdate : PFObject, PFSubclassing  {
    
    // MARK: Class Variables 
    
    var updateTitle:String!
    var updateContent:String!
    var updateTimestamp:String!
    
    // MARK: Subclassing functions
    
    static func parseClassName() -> String {
        return "Update"
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
    
    // MARK: Constructer 
    
    init(title:String, content:String, timestamp:String) {
        super.init()
        self.setTitle(title)
        self.setContent(content)
        self.setTimestamp(timestamp)
    }
    
    func setTitle(title:String) {
        self.updateTitle = title
    }
    
    func setContent(content: String) {
        self.updateContent = content
    }
    
    func setTimestamp(time: String) {
        self.updateTimestamp = time
    }
    
    func getTitle() -> String {
        return self.updateTitle
    }
    
    func getContent() -> String {
        return self.updateContent
    }
    
    func getTimestamp() -> String {
        return self.updateTimestamp
    }
}