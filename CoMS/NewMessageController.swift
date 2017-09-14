//
//  NewMessageController.swift
//  CoMS
//
//  Created by Pham Van Thien on 9/11/17.
//  Copyright © 2017 Pham Van Thien. All rights reserved.
//

import UIKit

class NewMessageCell: UITableViewCell {
    
    @IBOutlet weak var ivAvatar: UIImageView!
}

class NewMessageController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
    
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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewMessageCell
        cell.ivAvatar.maskCircle(anyImage: UIImage(named: "ic_test")!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 57.0
    }
    
    func filterContentForSearchText(searchText: String){
        print(searchText)
    }
    
    @IBAction func onSearch(_ sender: Any) {
        let resultController = UITableViewController(style: .plain)
        let searchController = UISearchController(searchResultsController: resultController)
        searchController.searchResultsUpdater = self
       // searchController.searchBar.placeholder = "Tìm kiếm"
       // searchController.searchBar.setValue("Đóng", forKey: "_cancelButtonText")
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        self.present(searchController, animated: true, completion: nil)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
    
    @IBAction func onDismiss(_ sender: Any) {
        dissmissDetail()
    }
    
    func onRefresh(){
        refresher.endRefreshing()
    }
}
