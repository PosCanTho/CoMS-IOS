//
//  NotificationViewController.swift
//  CoMS
//
//  Created by iMac1 on 9/8/17.
//  Copyright © 2017 ComeForChange. All rights reserved.
//

import UIKit
class NotificationCell : UITableViewCell{
    
    @IBOutlet weak var ivAvatar: UIImageView!
    @IBOutlet weak var lbMessage: UILabel!
    
    func initiUI(){
        ivAvatar.maskCircle(anyImage: UIImage(named: "ic_test")!)
    }
}

class NotificationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var listNotification: [String] = ["Thông báo: CoMS đang cập nhật.","Thông báo: hệ thông đang bảo trì vui lòng xem lại sau.", "Thông báo: Cập nhật"]
    var refresher: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI(){
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        
        refresher = setTableviewRefresh(title: NSAttributedString(string: "Load more..."), action: #selector(onRefresh), tableView: tableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listNotification.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotificationCell
        cell.initiUI()
        cell.lbMessage.text = listNotification[indexPath.row]
        return cell
    }
    
    func onRefresh(){
        print("OKE")
    }
    
}
