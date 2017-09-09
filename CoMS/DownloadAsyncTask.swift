//
//  DownloadAsynTask.swift
//  CoMS
//
//  Created by Pham Van Thien on 9/7/17.
//  Copyright © 2017 Pham Van Thien. All rights reserved.
//

import Foundation
import UIKit
import HandyJSON
import SwiftOverlays

class DownloadAsyncTask {
    
    public static func GET(url: String, showDialog: Bool, downloadCalback: @escaping (_ errorCode: Int, _ message: String, _ data: String?) -> Void){
        if Utils.isConnectedToNetwork() == false {/*Rớt mạng*/
            downloadCalback(Constants.ERROR_CODE_ERROR, "Sorry, no Internet connectivity detected. Please reconnect and try again.", nil)
            SwiftOverlays.removeAllBlockingOverlays()
        }else{
            let session = URLSession.shared
            let headers = [
                "content-type": "application/json",
                "authorization": "bearer _zE0UILOY9VJzpZ-lxFXOag6LXWp5OBIYItSKdGjlny8ye8Banuvx-MxR-4xF1whgMf4xucBoVRcpo78peM55eLH9lgAUWJj2Qz19jr8LUHMbljeeQFqvPwA1pnry-2AYUlfZOPL2a12x-y3qXyGM0mrvF9y4IDnQGtsNNk83iptD-r4HVB7H0GSLNnsbxPjKDhOZ6GSTV7kYNx9Wfx-Yg",
                "cache-control": "no-cache",
                "postman-token": "f05da2d1-ffe9-895f-baf0-8dfb3a5b0fcb"
            ]
           if url.isEmpty { /*Truyền tham số sai*/
                DebugLog.printLog(msg: Constants.DOWNLOAD_ERROR+":Đường dẫn (URL) truyền vào rỗng.")
                SwiftOverlays.removeAllBlockingOverlays()
                return
            }
            let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                              cachePolicy: .useProtocolCachePolicy,
                                              timeoutInterval: 10.0)

            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers
            
            if showDialog {
                SwiftOverlays.showBlockingWaitOverlayWithText("Loading...")
            }
            DebugLog.printLog(msg: "URL_REQUEST: "+url)
            
            let task = session.dataTask(with: request as URLRequest) {
                (data, response, error) in
                DispatchQueue.main.async {
                    SwiftOverlays.removeAllBlockingOverlays()
                }
                if error != nil {/*Lỗi trong quá trình tải*/
                    DebugLog.printLog(msg: "DOWNLOAD_ERROR: Lỗi trong quá trình tải, tên lỗi: "+error!.localizedDescription)
                    downloadCalback(Constants.ERROR_CODE_ERROR, "Sorry an error has occurred.", nil)
                }else{
                    /*Dữ liệu trả về rỗng*/
                    guard let data = data else{
                        DebugLog.printLog(msg: Constants.DOWNLOAD_ERROR+": Dữ liệu trả về rỗng.");
                        downloadCalback(Constants.ERROR_CODE_ERROR, "Sorry an error has occurred.", nil)
                        return
                    }
                    
                    do{
                        let jsonEncode = String(data: data, encoding: .utf8)
                        let dataEncode = jsonEncode?.data(using: String.Encoding.utf8, allowLossyConversion: false)!
                        DebugLog.printLog(msg: Constants.DOWNLOAD_RESPONSE+": "+jsonEncode!)
                        
                        if dataEncode == nil || jsonEncode == nil{/*Lỗi trong quá trình encode*/
                            DebugLog.printLog(msg: Constants.DOWNLOAD_ERROR+": Lỗi trong quá trình encode.")
                            downloadCalback(Constants.ERROR_CODE_ERROR, "Sorry an error has occurred.", nil)
                        }else{
                            let json = try? JSONSerialization.jsonObject(with: dataEncode!, options: []) as! [String: AnyObject]
                            
                            guard let errorCode = json?["errorCode"] as? Int else {
                                DebugLog.printLog(msg: Constants.DOWNLOAD_ERROR+": Chuỗi json không có errorCode.")
                                downloadCalback(Constants.ERROR_CODE_ERROR, "Sorry an error has occurred.", jsonEncode)
                                return
                            }
                            guard let message = json?["message"] as? String else {
                                DebugLog.printLog(msg: Constants.DOWNLOAD_ERROR+": Chuỗi json không có message.")
                                downloadCalback(Constants.ERROR_CODE_ERROR, "Sorry an error has occurred.", jsonEncode)
                                return
                            }
                            guard let data = json?["data"] as? String else {/*Data trả về nil*/
                                downloadCalback(errorCode, message, nil)
                                return
                            }
                            downloadCalback(errorCode, message, data)
                        }
                    } catch{
                        DebugLog.printLog(msg: "Dữ liệu trả về không đúng định dạng Json.")
                        downloadCalback(Constants.ERROR_CODE_ERROR, "Sorry an error has occurred.", nil)
                    }
                    
                }
            }
            task.resume()
            
        }
    }
    
    public static func POST(url: String, body: [String: Any], showDialog: Bool, downloadCalback: @escaping (_ errorCode: Int, _ message: String, _ data: String?) -> Void){
        if Utils.isConnectedToNetwork() == false {/*Rớt mạng*/
            downloadCalback(Constants.ERROR_CODE_ERROR, "Sorry, no Internet connectivity detected. Please reconnect and try again.", nil)
            SwiftOverlays.removeAllBlockingOverlays()
        }else{
            let session = URLSession.shared
            let headers = [
                "content-type": "application/json",
                "authorization": "bearer _zE0UILOY9VJzpZ-lxFXOag6LXWp5OBIYItSKdGjlny8ye8Banuvx-MxR-4xF1whgMf4xucBoVRcpo78peM55eLH9lgAUWJj2Qz19jr8LUHMbljeeQFqvPwA1pnry-2AYUlfZOPL2a12x-y3qXyGM0mrvF9y4IDnQGtsNNk83iptD-r4HVB7H0GSLNnsbxPjKDhOZ6GSTV7kYNx9Wfx-Yg",
                "cache-control": "no-cache",
                "postman-token": "f05da2d1-ffe9-895f-baf0-8dfb3a5b0fcb"
            ]
            if url.isEmpty { /*Truyền tham số sai*/
                DebugLog.printLog(msg: Constants.DOWNLOAD_ERROR+":Đường dẫn (URL) truyền vào rỗng.")
                SwiftOverlays.removeAllBlockingOverlays()
                return
            }
            
//            let parameters = [
//                "PersonId": 1,
//                "PersonIdBookmark": 2
//                ] as [String : Any]
            
            let postData = try? JSONSerialization.data(withJSONObject: body, options: [])


            let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                              cachePolicy: .useProtocolCachePolicy,
                                              timeoutInterval: 10.0)
            
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = headers
            request.httpBody = postData
            
            if showDialog {
                SwiftOverlays.showBlockingWaitOverlayWithText("Loading...")
            }
            DebugLog.printLog(msg: "URL_REQUEST: "+url)
            
            let task = session.dataTask(with: request as URLRequest) {
                (data, response, error) in
                DispatchQueue.main.async {
                    SwiftOverlays.removeAllBlockingOverlays()
                }
                if error != nil {/*Lỗi trong quá trình tải*/
                    DebugLog.printLog(msg: "DOWNLOAD_ERROR: Lỗi trong quá trình tải, tên lỗi: "+error!.localizedDescription)
                    downloadCalback(Constants.ERROR_CODE_ERROR, "Sorry an error has occurred.", nil)
                }else{
                    /*Dữ liệu trả về rỗng*/
                    guard let data = data else{
                        DebugLog.printLog(msg: Constants.DOWNLOAD_ERROR+": Dữ liệu trả về rỗng.");
                        downloadCalback(Constants.ERROR_CODE_ERROR, "Sorry an error has occurred.", nil)
                        return
                    }
                    
                    do{
                        let jsonEncode = String(data: data, encoding: .utf8)
                        let dataEncode = jsonEncode?.data(using: String.Encoding.utf8, allowLossyConversion: false)!
                        DebugLog.printLog(msg: Constants.DOWNLOAD_RESPONSE+": "+jsonEncode!)
                        
                        if dataEncode == nil || jsonEncode == nil{/*Lỗi trong quá trình encode*/
                            DebugLog.printLog(msg: Constants.DOWNLOAD_ERROR+": Lỗi trong quá trình encode.")
                            downloadCalback(Constants.ERROR_CODE_ERROR, "Sorry an error has occurred.", nil)
                        }else{
                            let json = try? JSONSerialization.jsonObject(with: dataEncode!, options: []) as! [String: AnyObject]
                            
                            guard let errorCode = json?["errorCode"] as? Int else {
                                DebugLog.printLog(msg: Constants.DOWNLOAD_ERROR+": Chuỗi json không có errorCode.")
                                downloadCalback(Constants.ERROR_CODE_ERROR, "Sorry an error has occurred.", jsonEncode)
                                return
                            }
                            guard let message = json?["message"] as? String else {
                                DebugLog.printLog(msg: Constants.DOWNLOAD_ERROR+": Chuỗi json không có message.")
                                downloadCalback(Constants.ERROR_CODE_ERROR, "Sorry an error has occurred.", jsonEncode)
                                return
                            }
                            guard let data = json?["data"] as? String else {/*Data trả về nil*/
                                downloadCalback(errorCode, message, nil)
                                return
                            }
                            downloadCalback(errorCode, message, data)
                        }
                    } catch{
                        DebugLog.printLog(msg: "Dữ liệu trả về không đúng định dạng Json.")
                        downloadCalback(Constants.ERROR_CODE_ERROR, "Sorry an error has occurred.", nil)
                    }
                    
                }
            }
            task.resume()
            
        }
    }
    
    public static func POST(url: String, body: NSMutableData, showDialog: Bool, downloadCalback: @escaping (_ errorCode: Int, _ message: String, _ data: String?) -> Void){
        if Utils.isConnectedToNetwork() == false {/*Rớt mạng*/
            downloadCalback(Constants.ERROR_CODE_ERROR, "Sorry, no Internet connectivity detected. Please reconnect and try again.", nil)
            SwiftOverlays.removeAllBlockingOverlays()
        }else{
            let session = URLSession.shared
            let headers = [
                "content-type": "application/json",
                "authorization": "bearer _zE0UILOY9VJzpZ-lxFXOag6LXWp5OBIYItSKdGjlny8ye8Banuvx-MxR-4xF1whgMf4xucBoVRcpo78peM55eLH9lgAUWJj2Qz19jr8LUHMbljeeQFqvPwA1pnry-2AYUlfZOPL2a12x-y3qXyGM0mrvF9y4IDnQGtsNNk83iptD-r4HVB7H0GSLNnsbxPjKDhOZ6GSTV7kYNx9Wfx-Yg",
                "cache-control": "no-cache",
                "postman-token": "f05da2d1-ffe9-895f-baf0-8dfb3a5b0fcb"
            ]
            if url.isEmpty { /*Truyền tham số sai*/
                DebugLog.printLog(msg: Constants.DOWNLOAD_ERROR+":Đường dẫn (URL) truyền vào rỗng.")
                SwiftOverlays.removeAllBlockingOverlays()
                return
            }
            
            let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                              cachePolicy: .useProtocolCachePolicy,
                                              timeoutInterval: 10.0)
            
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = headers
            request.httpBody = body as Data
            
            if showDialog {
                SwiftOverlays.showBlockingWaitOverlayWithText("Loading...")
            }
            DebugLog.printLog(msg: "URL_REQUEST: "+url)
            
            let task = session.dataTask(with: request as URLRequest) {
                (data, response, error) in
                DispatchQueue.main.async {
                    SwiftOverlays.removeAllBlockingOverlays()
                }
                if error != nil {/*Lỗi trong quá trình tải*/
                    DebugLog.printLog(msg: "DOWNLOAD_ERROR: Lỗi trong quá trình tải, tên lỗi: "+error!.localizedDescription)
                    downloadCalback(Constants.ERROR_CODE_ERROR, "Sorry an error has occurred.", nil)
                }else{
                    /*Dữ liệu trả về rỗng*/
                    guard let data = data else{
                        DebugLog.printLog(msg: Constants.DOWNLOAD_ERROR+": Dữ liệu trả về rỗng.");
                        downloadCalback(Constants.ERROR_CODE_ERROR, "Sorry an error has occurred.", nil)
                        return
                    }
                    
                    do{
                        let jsonEncode = String(data: data, encoding: .utf8)
                        let dataEncode = jsonEncode?.data(using: String.Encoding.utf8, allowLossyConversion: false)!
                        DebugLog.printLog(msg: Constants.DOWNLOAD_RESPONSE+": "+jsonEncode!)
                        
                        if dataEncode == nil || jsonEncode == nil{/*Lỗi trong quá trình encode*/
                            DebugLog.printLog(msg: Constants.DOWNLOAD_ERROR+": Lỗi trong quá trình encode.")
                            downloadCalback(Constants.ERROR_CODE_ERROR, "Sorry an error has occurred.", nil)
                        }else{
                            let json = try? JSONSerialization.jsonObject(with: dataEncode!, options: []) as! [String: AnyObject]
                            
                            guard let errorCode = json?["errorCode"] as? Int else {
                                DebugLog.printLog(msg: Constants.DOWNLOAD_ERROR+": Chuỗi json không có errorCode.")
                                downloadCalback(Constants.ERROR_CODE_ERROR, "Sorry an error has occurred.", jsonEncode)
                                return
                            }
                            guard let message = json?["message"] as? String else {
                                DebugLog.printLog(msg: Constants.DOWNLOAD_ERROR+": Chuỗi json không có message.")
                                downloadCalback(Constants.ERROR_CODE_ERROR, "Sorry an error has occurred.", jsonEncode)
                                return
                            }
                            guard let data = json?["data"] as? String else {/*Data trả về nil*/
                                downloadCalback(errorCode, message, nil)
                                return
                            }
                            downloadCalback(errorCode, message, data)
                        }
                    } catch{
                        DebugLog.printLog(msg: "Dữ liệu trả về không đúng định dạng Json.")
                        downloadCalback(Constants.ERROR_CODE_ERROR, "Sorry an error has occurred.", nil)
                    }
                    
                }
            }
            task.resume()
            
        }
    }


}
