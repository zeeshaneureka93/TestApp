//
//  ViewController.swift
//  GithubHelper
//
//  Created by Zeeshan on 8/8/18.
//  Copyright © 2018 Zeeshan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchTf: UITextField!
    @IBOutlet weak var usersTableView: UsersTableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        usersTableView.userDetail = { selectedUser in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "UserDetailScreen") as! UserDetailScreen
            vc.userObj = selectedUser
            vc.followersUrl = selectedUser["followers_url"] as? String
            self.navigationController?.pushViewController(vc,
                                                     animated: true)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func getSearchUsersData() {
        let url = URL(string: Server.url + "search/users?q=\(searchTf.text!)")
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
                do {
                    let stringDic = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                    self.usersTableView.users = stringDic!["items"] as! [[String : Any]]
                } catch let error {
                    print(error)
                }
        }
        task.resume()
}
}
extension ViewController: UITextFieldDelegate  {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if !textField.text!.isEmpty {
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        getSearchUsersData()
    }
    
}

