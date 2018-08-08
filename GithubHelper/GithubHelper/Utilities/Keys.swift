//
//  Keys.swift
//  CoreDirection
//
//  Created by Ahmar on 8/18/17.
//  Copyright © 2017 Rebel Technology. All rights reserved.
//

import Foundation
import UIKit

// These are all the keys from server response ditionaries
struct Key {
    
    // MARK: - Response Modal
    struct Response {
        static let meta = "meta"
        static let data = "data"
        static let error = "error"
        static let code = "code"
        static let status = "status"
        
        static let success = "success"
        static let message = "message"
        static let title = "title"
        static let cmd = "cmd"
        static let alert = "alert"
        static let info = "info"

    }
    
    // MARK: - Session Modal
    struct Session    {
        static let authToken = "authToken"
        static let user = "user"
        static let keepLogin = "keepLogin"
        
    }

    // MARK: - Request Modal
    struct Request {
        static let currentPassword = "oldPassword"
        static let newPassword = "newPassword"
        static let usernameOrEmail = "usernameOrEmail"
        static let password = "password"
        static let interval = "interval"
        static let membershipNumber = "membershipNumber"
        static let classId = "classId"
        static let isPeriodExpired = "isPeriodExpired"
        static let workoutId = "workoutId"
        
        static let username = "username"
        static let email = "email"
        static let departmentId = "departmentId"
        static let corporateID = "corporateId"
        static let membershipNumberID = "membershipNumberId"
        static let phone = "phone"
        static let companyKey = "companyKey"
        static let keyID = "key_id"

        struct GamificationActions {
            static let type = "action_id"
            static let pointsToOveride = "points"
            static let id = "info_id"
            
        }
    }

    // MARK: - User Modal
    struct User {
        static let userId = "userId"
        static let userIdCaps = "UserId"
        static let authToken = "authToken"
        static let userAuthorization = "AuthorizationUserToken"
        static let authorization = "Authorization"
        static let encryption = "Encryption"
        static let compression = "Compression"

        static let deviceType = "DeviceType"
        static let deviceToken = "DeviceToken"        
        static let lang = "lang"
        
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let gender = "gender"
        static let dateOfBirth = "dateOfBirth"
        static let image = "image"
        static let email = "email"
        static let phone = "phone"

        static let id = "id"
        static let imageUrl = "imageUrl"
        static let joiningDate = "joiningDate"

        enum KeyType: String {
            case DiscountOnly="Discount"
            case PreloadedPackage="Package"
            case CorePass="CorePass"
            case Profile="Profile"
        }
        
        // MARK: - User Profile Modal
        struct Profile {
            static let id = "id"
            static let title = "title"
            static let code = "code"
            static let value = "value"
            static let iconUrl = "iconUrl"
            static let minValue = "min_value"
            static let maxValue = "max_value"
            static let unit = "unit"
            static let lastUpdated = "lastUpdated"
            static let status = "status"
            static let points = "points"
            static let detail = "detail"
            
            // MARK: - User Objectives Modal
            struct Objectives    {
                static let id = "id"
                static let title = "title"
                static let code = "code"
                static let status = "status"
                static let iconUrl = "iconUrl"
            }
        }
    }
    // MARK: - Search Parameters Modal
    struct Search {
        static let keyword = "keyword"
        static let filters = "filters"
        static let categories = "categories"
        static let tags = "tags"
        static let page = "page"
        static let pageSize = "pageSize"
        static let articleId = "articleId"
        static let resetFilter = "resetFilter"
        static let list = "list"
        static let totalRecords = "totalRecords"

        static let latitude = "latitude"
        static let longitude = "longitude"
        
        static let dateFrom = "dateFrom"
        static let date = "date"
        static let session = "session"
        static let distance = "distance"

        static let activities = "activities"
        static let amenities = "amenities"
        
        static let showFree = "show_free"
        static let showCorePass = "is_corepass"
        static let showPaid = "is_paid"


    }
}
