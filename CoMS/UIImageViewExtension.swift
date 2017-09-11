//
//  UIImageViewExtension.swift
//  CoMS
//
//  Created by Pham Van Thien on 9/11/17.
//  Copyright © 2017 Pham Van Thien. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    public func maskCircle(anyImage: UIImage){
        self.contentMode = UIViewContentMode.scaleAspectFill
        self.layer.cornerRadius = self.frame.height/2
        self.layer.masksToBounds = false
        self.clipsToBounds = true
        self.image = anyImage
    }
}
