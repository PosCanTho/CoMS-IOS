//
//  PastConference.swift
//  CoMS
//
//  Created by Pham Van Thien on 9/8/17.
//  Copyright © 2017 Pham Van Thien. All rights reserved.
//

import Foundation
import HandyJSON

class PastConference: HandyJSON {
    
    var CURRENT_FIRST_NAME: String = ""
    
    var CURRENT_MIDDLE_NAME: String = ""
    
    var CURRENT_LAST_NAME: String = ""
    
    var CONFERENCE_ID: Int = 0
    
    var CONFERENCE_NAME: String = ""
    
    var CONFERENCE_NAME_EN: String = ""
    
    var FROM_DATE: String = ""
    
    var THRU_DATE: String = ""
    required public init(){}
}
