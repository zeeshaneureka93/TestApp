//
//  Helper.swift
//  CoreDirection
//
//  Created by Adeel on 7/20/17.
//  Copyright © 2017 Rebel Technology. All rights reserved.
//

import Foundation
import UIKit

class Helper: NSObject {
    
    static func getFavoriteImage(_ status: Bool = true) -> UIImage  {
      return  (status ? UIImage(named:"favorite") : UIImage(named:"unFavorite"))!
    }
    static func composeTimeLocal(startDate:String,endDate:String)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(identifier: "UTC")!
        let startTime = dateFormatter.date(from: startDate)
        dateFormatter.dateFormat = "hh:mm a"
        let startRange =  dateFormatter.string(from: startTime!)
        print(startRange)
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let endTime = dateFormatter.date(from: endDate)
        dateFormatter.dateFormat = "hh:mm a"
        let endRange =  dateFormatter.string(from: endTime!)
        print(endRange)
        return String(format: "%@ - %@", startRange,endRange)
    }
    static func Hr_Format_To_12Hr(startDate:String)->Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(identifier: "UTC")!
        let startTime = dateFormatter.date(from: startDate)
        dateFormatter.dateFormat = "hh:mm a"
        let startRange =  dateFormatter.string(from: startTime!)
        return dateFormatter.date(from: startRange)!
    }
}
