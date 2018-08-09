//
//  UsersTableView.swift
//  GithubHelper
//
//  Created by Zeeshan on 8/8/18.
//  Copyright © 2018 Zeeshan. All rights reserved.
//

import UIKit

class UsersTableView: UITableView ,UITableViewDelegate, UITableViewDataSource{
    var users = [[String:Any]]()
 {
        didSet(newValue){
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
    }
    var userDetail : (([String:Any])-> Swift.Void)?
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
        return users.count
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.listCellIndetifier, for: indexPath) as! UsersTableViewCell
        let object = users[indexPath.row]
        cell.userName.text = object["login"] as? String
        cell.userImg.downloadedFrom(link: object["avatar_url"] as! String)
        return cell
    }
    
    // MARK:- UITableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object = users[indexPath.row]
        self.userDetail?(object)
    }
}
private struct Cell {
    static let listCellIndetifier = "UserTableViewCell"
}
extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}
