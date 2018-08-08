//
//  ServiceManager.swift
//  Bazhookah
//
//  Created by Muhammad Jabbar on 2/6/18.
//  Copyright © 2018 Muhammad Jabbar. All rights reserved.
//


import Foundation
import AVFoundation
import AVKit

enum RequestMethods: String {
    case POST
    case GET
}
enum RequestParametersMethods: String {
    case FORMDATA
    case RAW
    case NONE
}
enum ParsingError: Error {
    case invalidParsing(String)
    case invalidFileData(String)
    
}

class ServiceManager: NSObject {
    
    // Generic Overall Network requests
    class func request(baseUrl: String = Server.url,  requestMethod: RequestMethods = .GET, parameterEncodeing: RequestParametersMethods = .FORMDATA , method: String,
                       showHud: Bool = true, inView: UIView? = nil, parameters: [String: Any]?,imageDataKey: [String: UIImage]? = nil,
                       success: @escaping(_ response: Any) -> () , failure: @escaping(_ error: Error?) -> () )    {
        
        if ReachabilityManager.isNetworkConnected() {
            var requestUrl = baseUrl +  "\(method)"
            if requestMethod == .GET {
                if let parameter = parameters {
                requestUrl.append("?")
                for (key, value) in parameter {
                    requestUrl.append("\(key)=\(value)")
                    requestUrl.append("&")
                    }
                }
            }
            let url = URL(string: requestUrl)
            print("url: \(String(describing: url))")
            
            
            let request = NSMutableURLRequest(url:url!)
            request.httpMethod = requestMethod.rawValue
            request.timeoutInterval = 180
            let boundary = generateBoundaryString()
            
            print("parameters: \(parameters as Any)")
            if requestMethod == .POST {
                if parameterEncodeing == .FORMDATA {
                    request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
                    request.httpBody = ServiceManager.createBodyWithParameters(parameters: parameters, imageDataKey: imageDataKey, boundary: boundary) as Data //body as Data
                    
                }else if parameterEncodeing == .RAW {
                    
                    request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
                    if let json = try? JSONSerialization.data(withJSONObject: parameters as Any) {
                        request.httpBody = json
                    }
                }
            }
            if showHud {
                //HudView.showHudd()
//                if let hudView = inView{
//                    ActivityIndicator.showInView(view: hudView)
//                }else{
//                    ActivityIndicator.show()
//                }
            }
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                // You can print out response object
                print("******* response = \(String(describing: response))\n ******* error = \(String(describing: error))")
                if showHud {
                    DispatchQueue.main.async {
//                        if let hudView = inView {
//                            ActivityIndicator.hideInView(view: hudView)
//                        }else{
//                            ActivityIndicator.hide()
//                        }
                    }
                }
                if error != nil {
                    DispatchQueue.main.async {
                        failure(error)
                        return
                    }
                }else
                {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                        print(json as Any)
                        DispatchQueue.main.async {
                            if let meta = json?["meta"] as? [String:Any] {
                                if let statusCode = meta["code"] as? Int {
                                    if statusCode == ResponseCode.ok {
                                        success(json?["data"] ?? [:])
                                    }
                                    else{
                                            let error = NSError(domain:"Sorry",code:statusCode,userInfo:[NSLocalizedDescriptionKey:(json?["error"] as? String) ?? "Something went wrong please try again later."])
                                            print(error.localizedDescription)
                                        failure(error)
                                    }
                                }
                            }else{
                                if let messageTokenSavedDic = json?["data"] {
                                    success(messageTokenSavedDic)
                                }else{
                                let error = NSError(domain:"Sorry",code:500,userInfo:[NSLocalizedDescriptionKey:"Something went wrong please try again later."])
                                print(error.localizedDescription)
                                    failure(error)
                                }
                            }
                        }
                        
                    }catch
                    {
                        print(error)
                        if showHud {
                            DispatchQueue.main.async {
//                                if let hudView = inView {
//                                    ActivityIndicator.hideInView(view: hudView)
//                                }else{
//                                    ActivityIndicator.hide()
//                                }
                            }
                        }
                        failure(error)
                    }
                }
            }
            task.resume()
        }
        else    {
            // TODO: UNABLE TO SEND REQUEST, NO INTERNET
            print("UNABLE TO SEND REQUEST, NO INTERNET")
            let error = NSError(domain:"Sorry",code:100,userInfo:[NSLocalizedDescriptionKey:"It seems you are offline please connect to internet and try again later."])
            print(error.localizedDescription)
            failure(error)
        }
    }
    
    class func createBodyWithParameters(parameters: [String: Any]?, imageDataKey: [String: UIImage]?, boundary: String) -> NSData {
        let body = NSMutableData();
        if parameters != nil {
            for (key, value) in parameters! {
                body.appendString(string: "--\(boundary)\r\n")
                body.appendString(string: "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                body.appendString(string: "\(value)\r\n")
            }
        }
        
        if imageDataKey != nil {
            for (key, value) in imageDataKey! {
                let filename = "\(key).jpg"
                let mimetype = "image/jpg"
                
                body.appendString(string: "--\(boundary)\r\n")
                body.appendString(string: "Content-Disposition: form-data; name=\"\(key)\"; filename=\"\(filename)\"\r\n")
                body.appendString(string: "Content-Type: \(mimetype)\r\n\r\n")
                
//                let resizedImage = value.resize(toSize: CGSize(width: 800, height: 800))!
                let imageData = UIImageJPEGRepresentation(value, 0.3)
                print("the image size is \(ByteCountFormatter().string(fromByteCount: Int64(imageData!.count)))")
                
                if(imageData==nil)
                { continue }
                body.append(imageData!)
                body.appendString(string: "\r\n")
                body.appendString(string: "--\(boundary)--\r\n")
            }
        }
        return body
    }
    class func generateBoundaryString() -> String {
        return "Boundary-\(NSUUID().uuidString)"
    }
    
    // Log Error Seprate Request
    class func request(method:String = "POST", url : String, parameters: [String:String]?, success : ((Any)->Void)? = nil) {
        
        let urlString = URL(string: url)
        let request = NSMutableURLRequest(url:urlString!);
        request.httpMethod = method
        request.timeoutInterval = 180
        let boundary = generateBoundaryString()
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        let body = NSMutableData();
        if parameters != nil {
            for (key, value) in parameters! {
                body.appendString(string: "--\(boundary)\r\n")
                body.appendString(string: "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                body.appendString(string: "\(value)\r\n")
            }
        }
        request.httpBody = body as Data
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            // You can print out response object
            
            print("******* responseErrorLog = \(String(describing: response))\n ******* errorErrorLog = \(String(describing: error))")
            if error != nil {
                print(error as Any)
                    return
            }
            else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                    print(json as Any)
                    success?(json as Any)
                }
                catch(let error) {
                    let json = String(data: data!, encoding: .utf8)!
                    print(json as Any)
                    print(error)
                }
            }
        }
        task.resume()
        
    }
    
    
    class func requestFileDownload(methodType : String = "GET", fileUrlPath: String, showHud :Bool = false , success:@escaping (_ response:Any)->(), failure:@escaping (_ error:Error?)->())    {
        if ReachabilityManager.isNetworkConnected() {
            
            if showHud {
                DispatchQueue.main.async {
                    //                    HudView.showHudd()
                }
            }
            let url = URL(string: fileUrlPath)
            print("url = \(String(describing: url?.absoluteURL.absoluteString))")
            let request = NSMutableURLRequest(url:url!);
            request.httpMethod = methodType
            let boundary = generateBoundaryString()
            request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            
            request.timeoutInterval = 300
            let task = URLSession.shared.downloadTask(with: url!, completionHandler: { (urlOfFile, request, error) in
                
                if showHud {
                    DispatchQueue.main.async {
                        //                        HudView.dismiss()
                    }
                }
                if error != nil {
                    print("error=\(String(describing: error))")
                    //                    AlertViewController.showAlert(title: "Oops", message: (error?.localizedDescription)!)
                    failure(error)
                    return
                }
                print("urlOfFile=\(String(describing: urlOfFile))")
                if let datavalue = urlOfFile {
                    
                    DispatchQueue.main.async {
                        
                        success(datavalue as Any)
                    }
                }else{
                    
                    failure(ParsingError.invalidFileData("the file is not with valid data"))
                }
            })
            task.resume()
        }
        else    {
            // TODO: UNABLE TO SEND REQUEST, NO INTERNET
            print("UNABLE TO SEND REQUEST, NO INTERNET")
            //            AlertViewController.showAlert(message: "Please check your internet connection. You are seems offline.")
        }
    }

    fileprivate class func convertToJsonString(json: [String: Any]) -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
            return String(data: jsonData, encoding: .utf8)
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
    class func logError(url: String, headers: [String: String]?,  parameters: [String: Any], response: Data?, errorString: String? = nil, isFromLogManager : Bool = false) {
        
        var resposneString = "Unable to get response string"
        if let data = response {
            resposneString =  String(data: data, encoding: .utf8) ?? "Unable to get response string"
        }
        if resposneString.isEmpty  || resposneString == "Unable to get response string" {
            if let errorToSend = errorString  {
                resposneString = "\(String(describing: errorToSend))"
            }
            print("issue found in error Logging")
        }
        var headersString = "No headers"
        if let data = headers {
            headersString =  self.convertToJsonString(json: data) ?? "No headers"
        }
    }
}

extension NSMutableData {
    func appendString(string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        append(data!)
    }
}

