//
//  MediaHelper.swift
//  CoreDirection
//
//  Created by Ahmar on 3/27/18.
//  Copyright © 2018 Rebel Technology. All rights reserved.
//

import UIKit
import AVKit

class MediaHelper: NSObject {
    
    static func getMediaDuration(url: URL!) -> Float64{
        let asset : AVURLAsset = AVURLAsset(url: url) as AVURLAsset
        let duration : CMTime = asset.duration
        return CMTimeGetSeconds(duration)
    }
}

