//
//  Appearance.swift
//  Alamh
//
//  Created by Muhammad Jabbar on 12/17/16.
//  Copyright © 2016 Lucky Brothers. All rights reserved.
//

import UIKit
import Foundation

class Appearance: NSObject {

   static func apply()  {
    
    let navigationBarAppearance = UINavigationBar.appearance()
    navigationBarAppearance.barTintColor = UIColor.white
    navigationBarAppearance.tintColor = UIColor.white
    navigationBarAppearance.titleTextAttributes = [
        NSForegroundColorAttributeName : UIColor.white,
        NSFontAttributeName: UIFont.gotham_Bold()]
    
    let backgroundImage = UIImage(named: "navbar")
    let backIcon = UIImage(named: "arrow")?.imageWithInsets(insets: UIEdgeInsetsMake(10, 10, 0, 10))
    navigationBarAppearance.backIndicatorImage = backIcon
    navigationBarAppearance.backIndicatorTransitionMaskImage = backIcon
    navigationBarAppearance.shadowImage = UIImage()
    navigationBarAppearance.setBackgroundImage(backgroundImage, for: .default)
    navigationBarAppearance.isTranslucent = false
    
    let barItemAppearance = UIBarButtonItem.appearance()
    barItemAppearance.tintColor = UIColor.white
    barItemAppearance.setTitleTextAttributes([
        NSForegroundColorAttributeName : UIColor.white,
        NSFontAttributeName: UIFont.gotham_Bold()], for: .normal)

    }
    static func addBackgroundColour(navigationBar: UINavigationBar? = nil){
        let backgroundImage = UIImage(named: "navbar")
        navigationBar?.setBackgroundImage(backgroundImage, for: .default)
        navigationBar?.shadowImage = UIImage()
        navigationBar?.isTranslucent = false
    }
    static func removeBackgroundColour(navigationBar: UINavigationBar? = nil){
        navigationBar?.setBackgroundImage(UIImage(), for: .default)
        navigationBar?.shadowImage = UIImage()
        navigationBar?.isTranslucent = true
    }
    static func colourStatusBar(){
        UIApplication.shared.statusBarView?.backgroundColor = UIColor.appGreen
    }
    static func clearStatusBar(){
        UIApplication.shared.statusBarView?.backgroundColor = UIColor.clear
    }
}
