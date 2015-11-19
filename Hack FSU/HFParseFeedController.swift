//
//  ParseFeedController.swift
//  Hack FSU
//
//  Created by Todd Littlejohn on 11/19/15.
//  Copyright © 2015 Todd Littlejohn. All rights reserved.
//

import Foundation
import Parse

class HFParseFeedController {
    
    init() {
        
    }
    
    static func getUpdatesFromParse() -> Array<HFUpdate>? {
        var updateFeedArray:[HFUpdate] = [HFUpdate]()
        let query = PFQuery(className: "Update")
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if let _ = objects {
                for update in objects! {
                    let newUpdateTitle = update.objectForKey("title") as! String
                    let newUpdateContent = update.objectForKey("subtitle") as! String
                    var tempTimestamp = update.createdAt!
                    tempTimestamp = tempTimestamp.dateByAddingTimeInterval(-18000)
                    let newUpdateTimestamp = dateToString(tempTimestamp)
                    let newUpdate = HFUpdate(title: newUpdateTitle, content: newUpdateContent, timestamp: newUpdateTimestamp)
                    updateFeedArray.append(newUpdate)
                    print("done")
                }
            } else {
                print(error)
            }
        }
        
        return updateFeedArray
    }
}

func dateToString(date: NSDate) -> String {
    //format date
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateStyle = .FullStyle
    let dateString = dateFormatter.stringFromDate(date)
    let brokenStringArray = dateString.componentsSeparatedByString(",")
    let dayOfWeek = brokenStringArray[0]
    let shortDay = longDayToShortDay(dayOfWeek)
    let time = timeAsIWantIt(date)
    return "\(shortDay) \(time)"
}

func longDayToShortDay(day: String) -> String {
    switch(day) {
    case "Sunday": return "Sun"
    case "Monday": return "Mon"
    case "Tuesday": return "Tues"
    case "Wedneday": return "Wed"
    case "Thursday": return "Thur"
    case "Friday": return "Fri"
    case "Saturday": return "Sat"
    default: return "Sat"
    }
}

func timeAsIWantIt(date: NSDate) -> String {
    //format date
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "hh:mm"
    let dateString = dateFormatter.stringFromDate(date)
    let timeComponents = dateString.componentsSeparatedByString(":")
    var hour = Int(timeComponents[0])
    if hour >= 12 {
        hour = hour! - 12
        return "\(hour):\(timeComponents[1]) PM"
    } else {
        return "\(hour):\(timeComponents[1]) AM"
    }
    
}