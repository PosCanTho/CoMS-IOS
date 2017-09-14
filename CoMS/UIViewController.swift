//
//  UIViewController.swift
//  CoMS
//
//  Created by Pham Van Thien on 9/11/17.
//  Copyright © 2017 Pham Van Thien. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    func presentDetail(_ viewControllerToPresent: UIViewController){
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        self.view.window!.layer.add(transition, forKey: kCATransition)
        present(viewControllerToPresent, animated: false, completion: nil)
    }
    
    func dissmissDetail(){
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        self.view.window!.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false, completion: nil)
    }
    
    func getHeightKeyboard(_ notification: Notification)-> CGFloat{
        let keyboardHeight: CGFloat
        if let keyboardFrame: NSValue =  notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
             keyboardHeight = keyboardRectangle.height
            return keyboardHeight
        }
        return CGFloat()
    }
    
    func setTableviewRefresh(title: NSAttributedString, action: Selector, tableView: UITableView) -> UIRefreshControl{
        let refresher: UIRefreshControl = UIRefreshControl()
        refresher.attributedTitle = title
        refresher.addTarget(self, action: action, for: .valueChanged)
        tableView.addSubview(refresher)
        return refresher
    }
}
