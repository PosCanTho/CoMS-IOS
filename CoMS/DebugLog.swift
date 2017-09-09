//
//  DebugLog.swift
//  CoMS
//
//  Created by Pham Van Thien on 9/7/17.
//  Copyright © 2017 Pham Van Thien. All rights reserved.
//

import Foundation
struct DebugLog {
    public static func printLog(msg: String){
        if Constants.IS_DEBUG {
            print(msg)
        }
    }
}
