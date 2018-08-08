//
//  NetworkToast.swift
//  CoreDirection
//
//  Created by Yasir Ali on 8/10/17.
//  Copyright © 2017 Rebel Technology. All rights reserved.
//

import Foundation
import UIKit

class NetworkToast {
    var toastLabel: InsetLabel!
    var isVisible = false
    
    fileprivate static let shared = NetworkToast()
    
    class func dismiss() {
        if !shared.isVisible    {
            return
        }
        UIView.animate(withDuration: 0.3, delay: 1, options: .curveEaseOut, animations: {
            shared.toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            shared.toastLabel.removeFromSuperview()
            shared.isVisible = false
        })
    }
    
    fileprivate class func makeLabel(message: String) -> InsetLabel {
        let controller = UIManager.rootController()
        var tabBarHeight = CGFloat(0)

        Console.log(info: String(describing: type(of: controller)), sender: self)
        if controller is TabbarViewController   {
//            Console.log(info: "Controller is tabbar", sender: self)
            tabBarHeight = 49
        }
//        else    {
//            if controller is UINavigationController {
//                let navigationController = controller as! UINavigationController
//                let controller = navigationController.topViewController
//                
//                Console.log(info: String(describing: type(of: controller)), sender: self)
//            }
//            Console.log(info: "Controller is NOT tabbar", sender: self)
//        }
        let view = controller.view!
        let toastWidth = view.frame.width
        
        let frame = CGRect(x: 0, y: view.frame.height - (35 + tabBarHeight), width: toastWidth, height: 35)
        
        let toastLabel = InsetLabel(frame: frame)
        toastLabel.backgroundColor = UIColor.appRed
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center
        toastLabel.font = UIFont.gothamLight(size: Fonts.Size.small)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.clipsToBounds  =  true
        
        view.addSubview(toastLabel)
        return toastLabel
    }
    
    class func show(message: String = NSLocalizedString("No_Internet_Connection", comment: ""))    {
        if shared.isVisible {
            return
        }
        shared.toastLabel = makeLabel(message: message)
        shared.isVisible = true
    }
    
    class func bringToFront()   {
        if shared.isVisible {
            shared.toastLabel.removeFromSuperview()
            shared.isVisible = false
            show()
        }
    }
}
