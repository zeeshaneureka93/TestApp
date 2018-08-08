//
//  Model.swift
//  GithubHelper
//
//  Created by Zeeshan on 8/8/18.
//  Copyright © 2018 Zeeshan. All rights reserved.
//

import UIKit

class Model: NSObject {
    struct User : Codable{
        let incomplete_results : Int?
        let items : [items]
    }
    struct items : Codable {
        let followers_url : String?
        let following_url : String?
        let gists_url : String?
        let gravatar_id : Int?
        let html_url : String?
        let id : Int?
        let login : String?
        let score : Int?
        let site_admin : String?
        let starred_url : String?
        let subscriptions_url : String?
    }
}
