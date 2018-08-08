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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func getSearchUsersData() {
        
//        ServiceManager.request(parameterEncodeing: .RAW, method: "search/users" , parameters: ["q" : searchTf.text!], success: { (response) in
//            if let resposneDic = response  as? [String:Any] {
//                guard let authToken =  resposneDic["authToken"] as? String, let userDic = resposneDic["user"] as? [String:Any] else{
//                    return
//                }
//            }
//
//        }, failure: { (error) in
//
//        })
        let url = URL(string: Server.url + "search/users?q=\(searchTf.text!)")
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            do {
                do {
                    let stringDic = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                    print(stringDic)
                    self.usersTableView.activities = stringDic!["items"] as! [[String : Any]]
                } catch let error {
                    print(error)
                }
                //here dataResponse received from a network request
                let decoder = JSONDecoder()
                let model = try decoder.decode([Model.User].self, from:
                    data!) //Decode JSON Response Data
                print(model)
            } catch let parsingError {
                print("Error", parsingError)
            }
            
        }
        
        task.resume()
        
//        var date = [String]()
//        let selectedDates = objActivitySearch.selectedDates.filter { (date: ActivityDate) -> Bool in
//            return date.isSelected
//        }
//        let formatter = DateFormatter()
//        formatter.dateFormat = "YYYY-MM-dd"
//
//        for obj in selectedDates {
//            date.append(String(format: "%@", obj.date.dateString(displayFormatter: "YYYY-MM-dd", displayTimeZone : .UTC  , displayLocale: .en_US_POSIX)))
//        }
//
//        let session = objActivitySearch.sessionList.joined(separator: ",")
//        var selectedActivities : [String] = [String]()
//        var selectedAmeneties : [String] = [String]()
//
//        for item in selectedActivitiesArray {
//            selectedActivities.append(item.code)
//        }
//
//        for item in selectedAmenitiesArray {
//            selectedAmeneties.append(item.code)
//        }
//        let dictParams : [String: Any] = [Key.Search.activities: selectedActivities, Key.Search.amenities: selectedAmeneties]
//        let parameters : [String: Any] = [Key.Search.dateFrom: objActivitySearch.dateFrom,
//                                          Key.Search.latitude: LocationManager.sharedInstance.userLocationLatitude,
//                                          Key.Search.longitude : LocationManager.sharedInstance.userLocationLongitude,
//                                          Key.Search.date : date.joined(separator: ","),
//                                          Key.Search.session: session,
//                                          Key.Search.distance: objActivitySearch.distance,
//                                          Key.Search.keyword: searchTextField.text ?? "",
//                                          Key.Search.filters: dictParams,
//                                          Key.Search.showCorePass: objActivitySearch.showCorePass  ? 1 : 0,
//                                          Key.Search.showFree: objActivitySearch.showFree  ? 1 : 0,
//                                          Key.Search.showPaid: objActivitySearch.showPaid  ? 1 : 0]
//        //        let parameters : [String: Any] = [Key.Search.dateFrom: objActivitySearch.dateFrom,
//        //                                          Key.Search.latitude: 25.070224761963,
//        //                                          Key.Search.longitude : 55.134895324707,
//        //                                          Key.Search.date : date.joined(separator: ","),
//        //                                          Key.Search.session: session,
//        //                                          Key.Search.distance: objActivitySearch.distance,
//        //                                          Key.Search.keyword: searchTextField.text ?? "",
//        //                                          Key.Search.filters: dictParams,
//        //                                          Key.Search.showCorePass: objActivitySearch.showCorePass  ? 1 : 0,
//        //                                          Key.Search.showFree: objActivitySearch.showFree  ? 1 : 0,
//        //                                          Key.Search.showPaid: objActivitySearch.showPaid  ? 1 : 0]
//        SerializableRequestManager<PaginationFilterResponse<ActivityRecommended>>.request(api: API.activity.search, parameters: parameters, onSuccess: { paginationArticles in
//
//            if self.listTableView.page == 1 {
//                self.listTableView.activities = paginationArticles!.list
//                self.listTableView.total = paginationArticles!.totalRecord
//            }
//            else {
//                self.listTableView.activities += paginationArticles!.list
//                self.listTableView.total = paginationArticles!.totalRecord
//            }
//
//            self.showHideNoDataFound()
//            self.resultsTypeLabel.text = NSLocalizedString("SEARCH_RESULTS", comment: "")
//            self.updateItemsCountLabel()
//
//        }, onFailure: { error in
//
//        })
//    }


}
}
extension ViewController: UITextFieldDelegate  {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if !textField.text!.isEmpty {
//            self.listTableView.page = 1
//            getSearchActivitesData()
        }
        //        else{
        //            self.listTableView.activities = self.recomendedListResponse.list
        //            self.resultsTypeLabel.text = NSLocalizedString("RECOMMENDED", comment: "")
        //            self.updateItemsCountLabel()
        //            showHideNoDataFound()
        //        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        getSearchUsersData()
    }
    
}

