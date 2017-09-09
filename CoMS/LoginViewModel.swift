//
//  GreetingViewModel.swift
//  CoMS
//
//  Created by Pham Van Thien on 9/7/17.
//  Copyright © 2017 Pham Van Thien. All rights reserved.
//

import Foundation
class LoginViewModel: NSObject {
    let loginView: LoginView
    
    init(loginView: LoginView) {
        self.loginView = loginView
    }
    
    public func login(userName: String, passWord: String){
        if userName == "" {
            loginView.error(msg: "Vui long nhap ten tai khoan.")
        }else if passWord == "" {
            loginView.error(msg: "Vui long nhap mat khau.")
        }else{
         //   DownloadAsyncTask.GET(url: Constants.API_LOGIN, showDialog: false)
        }
    }
    
    public func login(userName: String, passWord: String, callback: (_ data: NSObject?,_ errorCode: Int,_ msg: String) -> Void){
        if userName == "" {
            callback(nil, 1, "Vui long nhap ten tai khoan.")
        }else if passWord == "" {
            callback(nil, 1, "Vui long nhap mat khau.")
        }else if userName == "admin" && passWord == "12345"{
            callback(nil, 0, "Dang nhap thanh cong.")
        }else{
            callback(nil, 1, "Dang nhap that bai.")
        }
    }
}
