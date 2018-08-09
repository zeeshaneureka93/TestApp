//
//  UsersDetailTableView.swift
//  GithubHelper
//
//  Created by Zeeshan on 8/9/18.
//  Copyright © 2018 Zeeshan. All rights reserved.
//

import UIKit

class UsersDetailTableView: UITableView ,UITableViewDelegate, UITableViewDataSource{
    var userFollowers = [[String:Any]]()
    {
        didSet(newValue){
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
    }
    // MARK:- View Life Cycle
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.dataSource = self
        self.delegate = self
        self.estimatedRowHeight = self.rowHeight
        self.rowHeight = UITableViewAutomaticDimension
        self.reloadData()
    }
    // MARK:- UITableView Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userFollowers.count
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.listCellIndetifier, for: indexPath) as! UsersTableViewCell
        let object = userFollowers[indexPath.row]
        cell.userName.text = object["login"] as? String
        cell.userImg.downloadedFrom(link: object["avatar_url"] as! String)
        return cell
    }
}
private struct Cell {
    static let listCellIndetifier = "UserTableViewCell"
}
