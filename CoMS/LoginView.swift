//
//  PersonViewModelProtocol.swift
//  CoMS
//
//  Created by Pham Van Thien on 9/7/17.
//  Copyright © 2017 Pham Van Thien. All rights reserved.
//

import Foundation

protocol LoginView: class {
    func success()
    func error(msg: String)
}
