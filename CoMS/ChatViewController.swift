//
//  ChatViewController.swift
//  CoMS
//
//  Created by Pham Van Thien on 9/12/17.
//  Copyright © 2017 Pham Van Thien. All rights reserved.
//

import UIKit
class MesageCell: UITableViewCell {
    
    @IBOutlet weak var viewRight: UIView!
    @IBOutlet weak var lbMessageRight: UILabel!
    @IBOutlet weak var ivAvatarRight: UIImageView!
    @IBOutlet weak var lbTimeRight: UILabel!
   
    @IBOutlet weak var viewLeft: UIView!
    @IBOutlet weak var lbMessageLeft: UILabel!
    @IBOutlet weak var ivAvatarLeft: UIImageView!
    @IBOutlet weak var lbTimeLeft: UILabel!
    
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraintLeft: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraintRight: NSLayoutConstraint!
    
    func initUI(){
        viewLeft.layer.cornerRadius = 10
        viewRight.layer.cornerRadius = 10
    }
    
    func hideTextFieldTime(){
        widthConstraint.constant = 0
        bottomConstraintLeft.constant = 0
        bottomConstraintRight.constant = 0
    }
    
    func showTextFieldTime(){
        widthConstraint.constant = 8
        bottomConstraintLeft.constant = 10
        bottomConstraintRight.constant = 10
    }
    
}

class ChatViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    let listMessage: [String] = ["Xin chào", "Tin nhắn nhiều ký tự, Tin nhắn nhiều ký tự, Tin nhắn nhiều ký tự, Tin nhắn nhiều ký tự, Tin nhắn nhiều ký tự, ", "Tin nhắn mới"]
    var refresher: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
           }
    
    func initUI(){
        refresher = setTableviewRefresh(title: NSAttributedString(string: "Load more..."), action: #selector(onRefresh), tableView: tableView)
        
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        
        NotificationCenter.default.addObserver(self, selector: #selector(onShowKeyboard), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onHideKeyboard), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMessage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MesageCell
        let item = listMessage[indexPath.row]
        cell.ivAvatarLeft.maskCircle(anyImage: UIImage(named: "ic_test")!)
        cell.ivAvatarRight.maskCircle(anyImage: UIImage(named: "ic_test")!)
        cell.initUI()
        
        if indexPath.row == 1 {
            cell.ivAvatarRight.isHidden = true
            cell.viewRight.isHidden = true
            cell.hideTextFieldTime()
            
            
            
            cell.ivAvatarLeft.isHidden = false
            cell.viewLeft.isHidden = false
            
            
            cell.lbMessageLeft.text = item
        }else{
            cell.ivAvatarRight.isHidden = false
            cell.viewRight.isHidden = false
            
            cell.ivAvatarLeft.isHidden = true
            cell.viewLeft.isHidden = true
            
            cell.lbMessageRight.text = item
        }
        return cell
    }
    
    @IBAction func onDismiss(_ sender: Any) {
        dissmissDetail()
    }
    @IBAction func onSend(_ sender: Any) {
        print(tfMessage.text!)
    }
    
    func onShowKeyboard(_ notification: Notification){
        scrollView.setContentOffset(CGPoint(x: 0.0, y: getHeightKeyboard(notification)), animated: true)
    }
    
    func onHideKeyboard(){
        scrollView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(textField.text!)
        if textField.text! != "" {
            btnSend.setImage(UIImage(named: "ic_send"), for: .normal)
        }else{
            btnSend.setImage(UIImage(named: "ic_dont_send"), for: .normal)
        }
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        btnSend.setImage(UIImage(named: "ic_dont_send"), for: .normal)
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tfMessage.resignFirstResponder()
        return true
    }
    
    func onRefresh(){
        refresher.endRefreshing()
    }
}
