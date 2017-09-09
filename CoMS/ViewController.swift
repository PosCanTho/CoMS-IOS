//
//  ViewController.swift
//  CoMS
//
//  Created by Pham Van Thien on 9/7/17.
//  Copyright © 2017 Pham Van Thien. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LoginView {
    
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfPassWord: UITextField!
    
    var loginViewModel: LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginViewModel = LoginViewModel(loginView: self)
    }
    
    func success(){
        print("Login Sucess")
    }
    
    func error(msg: String){
        print("Message error: "+msg)
    }
    
    @IBAction func onLogin(_ sender: Any) {
        
        
        //        DownloadAsyncTask.GET(url: Constants.API_GET_MY_PROFILE+"?id=1", showDialog: true,downloadCalback:
        //            {(errorCode, message, data) in
        //                if errorCode == 0 {
        //                    if data != nil {
        //                        let user: User = User.deserialize(from: data)!
        //                        print(user.Fullname)
        //                    }
        //                }else{
        //                    print(message)
        //                }
        //        })
        
        
//        let body: [String: Any] = ["PersonId": 1, "PersonIdBookmark": 2]
//        DownloadAsyncTask.POST(url: Constants.API_GET_PROFILE,body: body, showDialog: true,downloadCalback:
//            {(errorCode, message, data) in
//                if errorCode == 0 {
//                    if data != nil {
//                        let user: User = User.deserialize(from: data)!
//                        print(user.Fullname)
//                    }
//                }else{
//                    print(message)
//                }
//        })
        
        let postData = NSMutableData(data: "username=pvthiendeveloper".data(using: String.Encoding.utf8)!)
        postData.append("&password=123456".data(using: String.Encoding.utf8)!)
        postData.append("&grant_type=password".data(using: String.Encoding.utf8)!)
        DownloadAsyncTask.POST(url: Constants.API_GET_TOKEN,body: postData, showDialog: true,downloadCalback:
                    {(errorCode, message, data) in
                        if errorCode == 0 {
                            if data != nil {
                             
                                                            }
                        }else{
                            print(message)
                        }
                           print("data: "+data!)
                })
    }
}

