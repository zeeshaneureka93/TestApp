//
//  UserDetailScreen.swift
//  GithubHelper
//
//  Created by Zeeshan on 8/9/18.
//  Copyright © 2018 Zeeshan. All rights reserved.
//

import UIKit

class UserDetailScreen: UIViewController {
    
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var usersDetailTableView: UsersDetailTableView!
    var userObj = [String:Any]()
    var followersUrl : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getUsersData()
        userName.text = userObj["login"] as? String
        userEmail.text = userObj["login"] as? String
        userAvatar.downloadedFrom(link: userObj["avatar_url"] as! String)
    }
    func getUsersData() {
        let url = URL(string: followersUrl!)
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            do {
                let stringDic = try JSONSerialization.jsonObject(with: data!, options: []) as? NSArray
                self.usersDetailTableView.userFollowers = stringDic as! [[String : Any]]
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
