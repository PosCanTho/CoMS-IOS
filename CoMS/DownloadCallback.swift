//
//  DownloadCallback.swift
//  CoMS
//
//  Created by Pham Van Thien on 9/7/17.
//  Copyright © 2017 Pham Van Thien. All rights reserved.
//

import Foundation
protocol DownloadCallback{
    func downloadSuccess(processId: Int, data: NSObject)
    func downloadError(processId: Int, msg: String)
}
