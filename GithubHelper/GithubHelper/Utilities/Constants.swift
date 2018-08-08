//
//  Constants.swift
//  CoreDirection
//
//  Created by Yasir Ali on 4/11/17.
//  Copyright © 2017 Rebel Technology. All rights reserved.
//

import Foundation
import UIKit

// MARK:- Fonts Configuration
struct Fonts {
    struct Gotham {
        static let bold = "GothamBold"
        static let boldItalic = "GothamBold-Italic"
        static let extraLight = "GothamExtraLight"
        static let extraLightItalic = "GothamExtraLight-Italic"
        static let ultra = "GothamUltra"
        static let ultraItalic = "GothamUltra-Italic"
        static let light = "Gotham-Light"
        static let bookItalic = "Gotham-BookItalic"
        static let gBold = "Gotham-Bold"
        static let black = "GothamBlack"
        static let blackItalic = "GothamBlack-Italic"
        static let thin = "GothamThin"
        static let thinItalic = "GothamThin-Italic"
        static let medium = "GothamMedium"
        static let mediumItalic = "GothamMedium-Italic"
        static let gothamLight = "GothamLight"
        static let gothamLightItalic = "GothamLight-Italic"
        static let gothamBoldItalic = "GothamBold-Italic"
        static let gothamBold = "GothamBold"
        static let gothamBook = "Gotham-Book"
    }
    struct Size {
        static let extraLarge: CGFloat = 30
        static let large: CGFloat = 26
        static let normal: CGFloat = 20
        static let small: CGFloat = 15
        static let verySmall: CGFloat = 11
    }
    
}

//App configuration
var  appConfig = [String:Any]()

// Should Choose User Selected Language or iOS
let isPreferredLanguageiOS = true

// Cofigure List of Supported languages here
let listOfSupportedLanguages = ["en"]//["en", "ar"]
let defaultLanguage = "en"

var lastUserSelectedLanguageCode = UserDefaults.standard.value(forKey: "UserLastSelectedLanguage") as? String ?? defaultLanguage

let currentLangugageCode = isPreferredLanguageiOS ? (Locale.current.languageCode ?? defaultLanguage) : lastUserSelectedLanguageCode

let currentLanguage = listOfSupportedLanguages.contains(currentLangugageCode) ? currentLangugageCode : defaultLanguage

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



struct AppKeys {
   static let gamification = dev
   fileprivate static let dev = "MjcwNzExYTUxY2RlYjQ3NGRhZjg5Nzc2NjU4NDI5ZWM"
   fileprivate static let live = "OGYyYTdjYjlmNzYwMjhjYTM4YTEyODcwMDk5Y2MzMDg"

}

// MARK:- Server Configuration
struct Server {
    
    static let url = domainDev
    static let assetsUrl = assetsDev

    
    // New Domains:
    private static let domainDev = "https://api.github.com/"
    private static let domainStaging = "http://stagingcoredirection.engagiv.com"
    private static let domainLive = "http://coredirection.engagiv.com"
    
    private static let prefix = "/api/v1/"
    
    private static let live = domainLive + prefix
    private static let dev = domainDev + prefix
    private static let staging = domainStaging + prefix

    private static let assetsLive = domainLive
    private static let assetsDev = domainDev
    private static let assetsStaging = domainStaging

    struct Authorization {
        static let type = "Basic "
        
        static let username = usernameDev
        static let password = passwordDev
        
        private static let usernameDev = "IOS_DEV_KEY"
        private static let usernameStaging = "IOS_LIVE_KEY"
        private static let usernameLive = "IOS_LIVE_KEY"
        
        private static let passwordDev = "basic123456_ios"
        private static let passwordStaging = "basic123456_ios"
        private static let passwordLive = "basic123456_ios"

    }

    struct ErrorCodes {
        static let defaultProfile = -9999
    }
}

struct GamificationConstatnts {
    static let maleIdlFatPersent = 14.0
    static let femaleIdlFatPersent = 21.0
}
struct PrivacyandTerms {
     static let gdpr = "https://www.coredirection.com/privacy-policy"
     static  let privacy = "https://www.coredirection.com/app-terms-of-use"
}
struct GamificationServer {
    static let url = live
    private static let domainDev = "http://gamification.engagiv.com/"
    private static  let domainLive = "http://gamification.engagiv.com/"
    private static let prefix = "web/"
    
    private static let live = domainLive + prefix
    private static let dev = domainDev + prefix
}

struct InvoiceServer {
    static let baseURL = live
    private static let dev = Server.url
    private static let live = Server.url
    
    // Url for dev and live will same
    struct urlCloseButton  {
        static let success = "http://coredirectiondev.engagiv.com/api/v1/success/"
        static let error = "http://coredirectiondev.engagiv.com/?error=1"
        static let noSlotsAvailableError = "http://coredirectiondev.engagiv.com/?error=2"
    }

    static let succcess = "successCheckoutHandler"
    static let error = "errorCheckoutHandler"

    struct StatusCode {
        static let success = 200
        static let slotError = 1001
        static let transactionError = 1002
    }

    
    struct urlType  {
        static let success = "success?"
        static let error = "error?"
        static let checkout = "checkout/"
    }

}

struct MessagingServer {
    static let saveDeviceToken = "http://messaging.engagiv.com/web/save_device_token"
}

// MARK:- API Configuration

struct API  {
    
    static let home = "user/home.json"
    static let home2 = "user/home2.json"
    static let errorLog = "user/logError.json"
    
    struct article {
        static let recommended = "article/recommended.json"
        static let search = "article/search.json"
        static let fetchTags = "article/fetchTags.json"
        static let favorites = "article/favorites.json"
        static let addFavorite = "article/addFavorite.json"
        static let removeFavorite = "article/removeFavorite.json"
        static let detail = "article/detail.json"
    }
    
    struct user {
        static let login = "user/login.json"
        static let forgetPassword = "user/forgetPassword.json"
        static let resetPassword = "user/resetPassword.json"
        static let register = "user/register.json"
        static let updateProfile = "user/updateProfile.json"
        static let profileCompletionSteps = "user/profileCompletionSteps.json"
        static let logMeasurement = "user/logMeasurement.json"
        static let measurements = "user/measurements.json"
        static let objectives = "user/objectives.json"
        static let logObjective = "user/logObjective.json"
        static let goals = "user/goals.json"
        static let logGoals = "user/logGoals.json"
        static let measurementHistory = "user/measurementHistory.json"
        static let uploadSelfie = "user/uploadSelfie.json"
        static let measurementCharts = "user/measurementCharts.json"
        static let cardInfo = "user/getCardInfo.json"
        static let redeemKey = "user/redeemKey.json"
        static let profileKeys = "user/profileKeys.json"
        static let promotionClickCount = "user/addClickcount.json"
    }
    
    
    struct company {
        static let info = "company/info.json"
    }
    
    struct workout {
        static let recommended = "workout/recommended.json"
        static let favorite = "workout/favorite.json"
        static let history = "workout/history.json"
        static let addHistory = "workout/addHistory.json"
        static let search = "workout/search.json"
        static let exercises = "workout/exercises.json"
        static let addFavorite = "workout/addFavorite.json"
        static let removeFavorite = "workout/removeFavorite.json"
    }
    
    struct activity {
        static let checkIn = "activity/checkin/listing.json"
        static let scheduleCheckIn = "activity/schedule/checkin.json"
        static let recommended = "activity/recommended.json"
        static let search = "activity/search.json"
        static let activitiesAmenities = "activity/activitiesAmenities.json"
        static let classDetail = "activity/classDetail.json"
        static let facilityDetail = "activity/facilityDetail.json"
        static let classPackages = "activity/classPackages.json"
        static let favorites = "activity/favorite.json"
        static let addFavorite = "activity/addFavorite.json"
        static let bookClass = "activity/bookClass.json"
        static let reserveClass = "activity/reserveClass.json"
        static let reserveByPackage = "activity/reserveByPackage.json"
        static let discardReservation = "activity/discardReservation.json"
        static let chargeCustomer = "activity/chargeCustomer.json"
        static let slotAvailable = "activity/slotAvailable.json"
        static let scheduleDetail = "activity/scheduleDetail.json"
        static let packageClasses = "activity/packageDetail.json"//"activity/packageClasses.json"
        static let checkSlotsCount = "activity/schedule/count.json"

    }
    
    struct wallet {
        static let walletList = "activity/wallet.json"
        static let cancelBooking = "activity/cancelBooking.json"
        static let walletBookedHistory = "activity/bookedHistory.json"
        static let walletSessionHistory = "activity/sessionHistory.json"

    }
    
    struct gamification {
        static let getAction = "get_action"
        static let addActionDetail = "add_action_detail"
        static let getBadgesAndLevels = "get_badges_and_levels"
        static let getLevelsInfo = "getlevelsinfo"
        static let getUserAction = "get_user_action"
        static let addUserAction = "add_user_action"
        static let getUserPoints = "get_user_points"
        static let getBadgesInfo = "getbadgesinfo"
        static let userLatestEarnBadgeLevel = "userLatestEarnbadgeLevel"
        
    }

}

struct ResponseCode {
    // 200: Success
    // 207: Validation errors. i.e Field required
    // 401: Unauthorized request
    // 403: Forbidden
    // 404: Content not found.
    // 405: Not Enabled    Account not activated
    // 300: Already Exist    Already used
    
    static let ok = 200
    static let validationError = 207//394
    static let alreadyExists = 300
    // For Log Out
    static let unauthorized = 401
    static let forbidden = 403
    static let invalidUser = 422
    ///////
    static let noDataFound = 404
    static let accountInActive = 405
    
    static let gamificationError = 1111
    static let noInternetError = 100
    static let gamificationParserError = 101
    

}

// MARK:- UI Classes Configuration

struct Storyboard  {
    
    static let authentication = "Authentication"
    static let tabbar = "Tabbar"
    static let profile = "Profile"
    static let article = "Article"
    static let workOut = "Workout"
    static let activity = "Activity"
    static let wallet = "Wallet"
}

struct Controller {
    static let articleList = "ArticleListViewController"
    static let filterNavigation = "FilterNavigationViewController"
    static let activityNavigation = "ActivityNavigationViewController"
    static let articleDetail = "ArticleDetailViewController"
    static let workOutRecommended = "WorkOutRecommendedViewController"
    static let workOutFavorite = "WorkoutFavoriteViewController"
    static let workOutHistory = "WorkOutHistoryViewController"
    static let workOutFilters = "WorkOutFiltersViewController"
    static let workOutFilterNavigation = "WorkOutFilterNavigation"
    
    struct Activity {
        static let activityFacilityDetail = "ActivityFacilityDetailViewController"
        static let slotsSelection = "SlotsSelectionViewController"
    }
    struct Wallet {
        static let sessions = "WalletSessionsViewController"
        static let membership = "WalletMemebershipsViewController"
        static let bookedHistory = "WalletBookedHistoryViewController"
    }
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


// MARK:- CoreData Configuration

// entity names
struct Entity {
    static let user = "AppUser"
    static let profile = "Profile"
    static let article = "Article"
    static let articleDetail = "ArticleDetail"
    static let exercise = "Exercise"
    static let sessionInfo = "SessionInfo"
    static let step = "Step"
    static let workout = "Workout"
    static let workoutLevel = "WorkoutLevel"
    static let workoutType = "WorkoutType"
    static let measurement = "Measurements"
    static let measurementsParam = "MeasurementsParam"
    // Gamification Entities
    static let level = "Level"
    static let action = "Action"
    static let badge = "Badge"
    static let pendingActions = "PendingActions"
}

// entities generic attributes
struct Attributes  {
    static let id = "id"
    static let totalRecords = "totalRecords"
    static let list = "list"
    static let recommended = "recommended"
    static let lastUpdated = "lastUpdated"
    static let title = "title"
    static let searchResults = "searchResults"
    static let isRecommended = "isRecommended"
    static let isFavorite = "isFavorite"
    static let isHistory = "isHistory"
}
