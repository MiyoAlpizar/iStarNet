//
//  MainTabView.swift
//  iSocialNet
//
//  Created by Miyo on 24/12/21.
//

import UIKit

class MainTabView: UITabBarController {

    // MARK: Properties
    var presenter: MainTabPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        createChildren()
    }
    
    func createChildren() {
        let homeVC = UINavigationController(rootViewController: HomeWireFrame.createHomeModule())
        homeVC.tabBarItem.image = UIImage(named: "home")
        homeVC.tabBarItem.selectedImage = UIImage(named: "home.fill")
        homeVC.navigationBar.prefersLargeTitles = true
        
        let messagesList = UINavigationController(rootViewController: MessagesWireFrame.createMessagesModule())
        messagesList.tabBarItem.image = UIImage(named: "message")
        messagesList.tabBarItem.selectedImage = UIImage(named: "message.fill")
        messagesList.navigationBar.prefersLargeTitles = true
        
        let addVC = UINavigationController(rootViewController: QuestionsWireFrame.createQuestionsModule())
        addVC.tabBarItem.image = UIImage(named: "plus.circle")
        addVC.tabBarItem.selectedImage = UIImage(named: "plus.circle.fill")
        addVC.navigationBar.prefersLargeTitles = true
       
        
        let notificationsVC = UINavigationController(rootViewController: NotificationsWireFrame.createNotificationsModule())
        notificationsVC.tabBarItem.image = UIImage(named: "bell")
        notificationsVC.tabBarItem.selectedImage = UIImage(named: "bell.fill")
        notificationsVC.navigationBar.prefersLargeTitles = true
        
        let profileVC = UINavigationController(rootViewController: ProfileWireFrame.createProfileModule())
        profileVC.tabBarItem.image = UIImage(named: "user")
        profileVC.tabBarItem.selectedImage = UIImage(named: "user.fill")
        profileVC.navigationBar.prefersLargeTitles = true
        
        viewControllers = [homeVC, messagesList, addVC, notificationsVC, profileVC]
    }
}

extension MainTabView: MainTabViewProtocol {
    // TODO: implement view output methods
}
