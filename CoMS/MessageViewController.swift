//
//  MessageViewController.swift
//  CoMS
//
//  Created by iMac1 on 9/8/17.
//  Copyright © 2017 ComeForChange. All rights reserved.
//

import UIKit

class ConversationCell: UITableViewCell {
    @IBOutlet weak var ivAvatar: UIImageView!
}

class MessageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    var refresher: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI()
    {
        refresher = setTableviewRefresh(title: NSAttributedString(string: "Load more..."), action: #selector(onRefresh), tableView: tableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ConversationCell
        cell.ivAvatar.maskCircle(anyImage: UIImage(named: "ic_test")!)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 57.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let chatController = ChatController()
//        chatController.name = "Pham Van Thien"
//        presentDetail(chatController)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let newMessageController = storyboard.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
        presentDetail(newMessageController)
    }
    
    func onRefresh(){
        refresher.endRefreshing()
    }

}
