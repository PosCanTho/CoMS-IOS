//
//  User.swift
//  CoMS
//
//  Created by Pham Van Thien on 9/8/17.
//  Copyright © 2017 Pham Van Thien. All rights reserved.
//

import Foundation
import HandyJSON

class User: HandyJSON {
    var PersonId: Int = 0
    var Fullname: String = ""
    var Email: String = ""
    var PhoneNumber: String = ""
    var BirthDay: String = ""
    var Gender: Int = 0
    var Image: String = ""
    required init(){}
    
}
