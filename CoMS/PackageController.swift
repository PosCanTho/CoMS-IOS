//
//  PackageController.swift
//  CoMS
//
//  Created by Pham Van Thien on 9/14/17.
//  Copyright © 2017 Pham Van Thien. All rights reserved.
//

import UIKit

class PackageController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    func initUI(){
        let listItem: [ItemPackageView] = createListItem()
        setupItemScrollView(listItem:listItem)
        
        pageControl.numberOfPages = listItem.count
        pageControl.currentPage = 0
    }
    
    func createListItem() -> [ItemPackageView]{
        let item1: ItemPackageView = Bundle.main.loadNibNamed("ItemPackage", owner: self, options: nil)?.first as! ItemPackageView
        item1.lb.text = "Item 1"
        
        let item2: ItemPackageView = Bundle.main.loadNibNamed("ItemPackage", owner: self, options: nil)?.first as! ItemPackageView
        item2.lb.text = "Item 2"
        return [item1, item2]
    }
    
    func setupItemScrollView(listItem: [ItemPackageView]){
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 300)
        scrollView.contentSize = CGSize(width: view.frame.width*CGFloat(listItem.count), height: 300)
        for i in 0 ..< listItem.count {
            listItem[i].frame = CGRect(x: view.frame.width*CGFloat(i), y: 0, width: view.frame.width, height: 300)
            scrollView.addSubview(listItem[i])
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    
}
