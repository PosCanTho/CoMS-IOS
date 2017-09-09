//
//  ResponseData.swift
//  CoMS
//
//  Created by Pham Van Thien on 9/8/17.
//  Copyright © 2017 Pham Van Thien. All rights reserved.
//

import Foundation
import HandyJSON

class ResponseData: HandyJSON {
    var errorCode: Int?
    var message: String?
    var data: Any?
   
    required init() {}
}
