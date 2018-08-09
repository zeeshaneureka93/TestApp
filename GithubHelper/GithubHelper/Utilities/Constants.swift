//
//  Constants.swift
//  CoreDirection
//
//  Created by Yasir Ali on 4/11/17.
//  Copyright © 2017 Rebel Technology. All rights reserved.
//

import Foundation
import UIKit

let listOfSupportedLanguages = ["en"]//["en", "ar"]
let defaultLanguage = "en"

var lastUserSelectedLanguageCode = UserDefaults.standard.value(forKey: "UserLastSelectedLanguage") as? String ?? defaultLanguage
let defaultLocale = Locale(identifier: "en_US_POSIX")
let currentLocale : Locale = {
    if  listOfSupportedLanguages.contains(Locale.current.languageCode ?? "") {
        return Locale.current
    }
    return defaultLocale
}()


let serverLocale = defaultLocale
var errorLogEnabled = true
let exceptionFound = "exceptionFound"

// MARK:- Server Configuration
struct Server {
    
    static let url = domainDev
    private static let domainDev = "https://api.github.com/"
    
    private static let prefix = "/api/v1/"
    
    private static let dev = domainDev + prefix

    struct ErrorCodes {
        static let defaultProfile = -9999
    }
}


struct ResponseCode {
    
    static let ok = 200
    static let validationError = 207//394
    static let alreadyExists = 300
    static let unauthorized = 401
    static let forbidden = 403
    static let invalidUser = 422
    static let noDataFound = 404
    static let accountInActive = 405
}


struct ScreenSize   {
    static let width        = UIScreen.main.bounds.size.width
    static let height       = UIScreen.main.bounds.size.height
    static let contentHeight = ScreenSize.height - 113 // 20 + 44 + 49 => status, navigation bar, tab bar
    static let maxLength    = max(ScreenSize.width, ScreenSize.height)
    static let minLength    = min(ScreenSize.width, ScreenSize.height)
}

struct ScreenCheck{
    static var kScreenBounds    :   CGRect = UIScreen.main.bounds
    static var isiPhone_4       :   Bool   = 480 == UIScreen.main.bounds.size.height ? true:false
    static var isiPhone_5       :   Bool   = 568 == UIScreen.main.bounds.size.height ? true:false
    static var isiPhone_6       :   Bool   = 667 == UIScreen.main.bounds.size.height ? true:false
    static var isiPhone_6_Plus  :   Bool   = 736 == UIScreen.main.bounds.size.height ? true:false
}

struct DeviceType   {
    static let iPhone4_OrLess   = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength < 568.0
    static let iPhone5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 568.0
    static let iPhone5_OrLess   = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength <= 568.0
    static let iPhone6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 667.0
    static let iPhone6Plus      = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 736.0
    static let iPhoneX          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 812.0
    static let iPad             = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.maxLength == 1024.0
}
