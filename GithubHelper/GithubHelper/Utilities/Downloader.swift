//
//  Downloader.swift
//  CoreDirection
//
//  Created by Yasir Ali on 7/20/17.
//  Copyright © 2017 Rebel Technology. All rights reserved.
//

import Foundation
import UIKit
class Downloader {
    
    class func download(image url:String) -> UIImage? {
        do {
            let data = try Data(contentsOf: URL(string: url)!)
            return UIImage(data: data)
        } catch  {
            return nil
        }
        
    }
}
