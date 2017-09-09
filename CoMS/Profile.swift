//
//  Profile.swift
//  CoMS
//
//  Created by Pham Van Thien on 9/8/17.
//  Copyright © 2017 Pham Van Thien. All rights reserved.
//

import Foundation
import HandyJSON

class Profile: HandyJSON {
    var PersonId: Int = 0
    var PersonIdBookmark: Int = 0
    var Name: String = ""
    var Description: String = ""
    var FacebookUrl: String = ""
    var TwitterUrl: String = ""
    var Instagram: String = ""
    var IsBookmark: Bool = false
    var ListPastConference: [PastConference]?
    required public init() {}
}
