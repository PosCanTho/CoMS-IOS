//
//  ViewController.swift
//  CoMS
//
//  Created by iMac1 on 9/6/17.
//  Copyright © 2017 ComeForChange. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var menuNameArray:Array = [String]()
    var icon:Array = [String]()
    var iconImage:Array = [UIImage]()
    @IBOutlet weak var viewMenu: UIView!
    @IBOutlet weak var lblAvatar: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var tableMenu: UITableView!
    
    var show: Bool = false
    let blackView = UIView()
    
    var onScheduleViewController: OnScheduleViewController!
    var conferenceViewController: ConferenceViewController!
    var profileViewController: ProfileViewController!
    var messgeViewController: MessageViewController!
    var notificationViewController: NotificationViewController!
    var settingViewController: SettingViewController!
    var bookmarkController: BookmarkController!
    
    
    @IBAction func showMenu(_ sender: Any) {
        if show == false{
            showMenu()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        setUpData()
        createListViewController()
    }
    
    func setUpData(){
        menuNameArray = ["Home","Schedule","Conference","Bookmark","Profile","Message","Notification","Setting","Sign out"]
        
        icon = ["1","2","3","4","5","6","7","8","9"]
        
//        iconImage = [UIImage(named: "ic_home")!,UIImage(named: "ic_calendar")!,UIImage(named: "ic_conference")!,UIImage(named: "ic_profile")!,UIImage(named: "ic_message")!,UIImage(named: "ic_notification")!,UIImage(named: "ic_settings")!,UIImage(named: "ic_logout")!]
//        
    }
    
    func createListViewController(){
        onScheduleViewController = self.storyboard?.instantiateViewController(withIdentifier: "OnScheduleViewController") as! OnScheduleViewController
        conferenceViewController = self.storyboard?.instantiateViewController(withIdentifier: "ConferenceViewController") as! ConferenceViewController
        profileViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        
        messgeViewController = self.storyboard?.instantiateViewController(withIdentifier: "MessageViewController") as! MessageViewController
        notificationViewController = self.storyboard?.instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
        settingViewController = self.storyboard?.instantiateViewController(withIdentifier: "SettingViewController") as! SettingViewController
        bookmarkController = self.storyboard?.instantiateViewController(withIdentifier: "BookmarkController") as! BookmarkController
    }
    
    func initUI(){
        tableMenu.delegate = self
        tableMenu.dataSource = self

        viewMenu.isHidden = true
        viewMenu.dropColor()
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        
        self.view.addGestureRecognizer(swipeRight)
        self.viewMenu.addGestureRecognizer(swipeLeft)
    }
    
    func respondToGesture(gesture : UISwipeGestureRecognizer){
        switch gesture.direction {
        case UISwipeGestureRecognizerDirection.right:
            showMenu()
        case UISwipeGestureRecognizerDirection.left:            closeMenu()
        default:
            break
        }
    }
    
    func createBlackView(){
        if let window = UIApplication.shared.keyWindow{
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            window.addSubview(blackView)
            window.addSubview(viewMenu)
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handeDismiss)))
            blackView.frame = window.frame
            blackView.alpha = 0
            UIView.animate(withDuration: 0.5, animations: {
                self.blackView.alpha = 1
            })
        }
    }
    
    func handeDismiss(){
        UIView.animate(withDuration: 0.5) { 
            self.blackView.alpha = 0
        }
        if show == true {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.viewMenu.frame = CGRect(x: -327, y: 0, width: self.viewMenu.frame.width, height: self.view.frame.height)
            }, completion: nil)
            show = false
        }
    }
    
    func showMenu() {
        viewMenu.isHidden = false
        UIView.animate(withDuration: 0) { 
            self.viewMenu.frame = CGRect(x: -327, y: 0, width: self.viewMenu.frame.width, height: self.view.frame.height)
        }
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.viewMenu.frame = CGRect(x: -10, y: 0, width: self.viewMenu.frame.width + 0, height: self.view.frame.height)
        }, completion: nil)
        if let applicationDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate? {
            if let window:UIWindow = applicationDelegate.window {
                window.addSubview(viewMenu)
                UIApplication.shared.keyWindow?.addSubview(viewMenu)
            }
        }
        show = true
        createBlackView()
    }
    
    func closeMenu(){
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.viewMenu.frame = CGRect(x: -327, y: 0, width: self.viewMenu.frame.width, height: self.view.frame.height)
        }, completion: nil)
        show = false
        handeDismiss()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuNameArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellMenu") as! TableViewCellMenu
        cell.lblName.text! = menuNameArray[indexPath.row]
        cell.lblIcon.text! = icon[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            self.onScheduleViewController.view.removeFromSuperview()
            self.conferenceViewController.view.removeFromSuperview()
            self.profileViewController.view.removeFromSuperview()
            self.messgeViewController.view.removeFromSuperview()
            self.notificationViewController.view.removeFromSuperview()
            self.settingViewController.view.removeFromSuperview()
            self.navigationItem.title = "Home"
            closeMenu()
            break
            
        case 1:
            self.addChildViewController(onScheduleViewController)
            self.view.addSubview(onScheduleViewController.view)
            self.navigationItem.title = "Schedule"
            closeMenu()
            break
            
        case 2:
            self.addChildViewController(conferenceViewController)
            self.view.addSubview(conferenceViewController.view)
            self.navigationItem.title = "Conference"
            closeMenu()
            break
        case 3:
            self.addChildViewController(bookmarkController)
            self.view.addSubview(bookmarkController.view)
            self.navigationItem.title = "Bookmark"
            closeMenu()
            break
            
        case 4:
            self.addChildViewController(profileViewController)
            self.view.addSubview(profileViewController.view)
            self.navigationItem.title = "Profile"
            closeMenu()
            break
            
        case 5:
            self.addChildViewController(messgeViewController)
            self.view.addSubview(messgeViewController.view)
            self.navigationItem.title = "Message"
            closeMenu()
            break
            
        case 6:
            self.addChildViewController(notificationViewController)
            self.view.addSubview(notificationViewController.view)
            self.navigationItem.title = "Notification"
            closeMenu()
            break
            
        case 7:
            self.addChildViewController(settingViewController)
            self.view.addSubview(settingViewController.view)
            self.navigationItem.title = "Setting"
            closeMenu()
            break
        case 8:
            print("Sign out")
        default:
            break
        }    }
    
}

