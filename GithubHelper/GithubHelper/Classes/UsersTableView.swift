//
//  UsersTableView.swift
//  GithubHelper
//
//  Created by Zeeshan on 8/8/18.
//  Copyright © 2018 Zeeshan. All rights reserved.
//

import UIKit

class UsersTableView: UITableView ,UITableViewDelegate, UITableViewDataSource{
    var activities = [[String:Any]]()
 {
        didSet(newValue){
            print(activities)
            self.reloadData()
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
        return activities.count
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.listCellIndetifier, for: indexPath) as! UsersTableViewCell
//        let tableSection = sections[sortedSections[indexPath.section]]
//        let object = tableSection![indexPath.row]
//        cell.setData(object)
//        cell.delegate = self
//        cell.tag = indexPath.row
//        cell.favoriteTappedBlock = { cell in
//            if let index = tableView.indexPath(for: cell) {
//                if let tableSection = self.sections[self.sortedSections[index.section]] {
//                    let object = tableSection[index.row]
//                    self.saveFavorite(activity: object)
//                }
//            }
//        }
//        cell.gymDetailTappedBlock = { cell in
//            if let index = tableView.indexPath(for: cell) {
//                if let tableSection = self.sections[self.sortedSections[index.section]] {
//                    let object = tableSection[index.row]
//                    self.gymDetail?(object)
//                }
//            }
//        }
//        cell.locationTappedBlock = { cell in
//            if let index = tableView.indexPath(for: cell) {
//                if let tableSection = self.sections[self.sortedSections[index.section]] {
//                    let object = tableSection[index.row]
//                    self.showLocationPreview?(object)
//                }
//            }
//        }
//        cell.updateCellImagesBlock = { cell in
//            if let index = tableView.indexPath(for: cell) {
//                if let tableSection = self.sections[self.sortedSections[index.section]] {
//                    let object = tableSection[index.row]
//                    cell.setImages(object)
//                }
//            }
//        }
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cellContentView = cell.contentView
        cellContentView.layer.transform = CATransform3DIdentity
        cellContentView.layer.opacity = 1;
        if let cell = cell as? UsersTableViewCell {
//            if let tableSection = sections[sortedSections[indexPath.section]] {
//                let object = tableSection[indexPath.row]
//                cell.setImages(object)
//            }
        }
    }
    
    // MARK:- UITableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let tableSection = sections[sortedSections[indexPath.section]]
//        let object = tableSection![indexPath.row]
//        self.activityDetail?(object)
    }
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 20))
//        view.backgroundColor = UIColor.clear
//        return view
//    }
    
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 10
//    }
}
private struct Cell {
    static let listCellIndetifier = "UserTableViewCell"
}
