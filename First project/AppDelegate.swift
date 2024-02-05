//
//  AppDelegate.swift
//  First project
//
//  Created by Akbarkhon Akramov on 20/12/23.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        let vc = ViewController()
        let saved = SavedViewController()
        let home = homeViewController()
        let create = createViewController()
        let message = messageViewController()
        
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.tabBarItem.title = "Профиль"
        navigationController.tabBarItem.image = UIImage(systemName: "person")
        
        let messageViewController = UINavigationController(rootViewController: message)
        messageViewController.tabBarItem.title = "Сообщения"
        messageViewController.tabBarItem.image = UIImage(systemName: "message")
        
        let createViewController = UINavigationController(rootViewController: create)
        createViewController.tabBarItem.title = "Создать"
        createViewController.tabBarItem.image = UIImage(systemName: "plus.circle")
        
        let starredViewController = UINavigationController(rootViewController: saved)
        starredViewController.tabBarItem.title = "Избранное"
        starredViewController.tabBarItem.image = UIImage(systemName: "star")
        
        let homeViewController = UINavigationController(rootViewController: home)
        homeViewController.tabBarItem.title = "Главная"
        homeViewController.tabBarItem.image = UIImage(systemName: "house")
        
        let barViewControl = UITabBarController()
        barViewControl.viewControllers = [homeViewController, starredViewController,createViewController, messageViewController, navigationController]
        barViewControl.selectedIndex = 0
        barViewControl.tabBar.selectedImageTintColor = UIColor(.black)
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = barViewControl
        window?.makeKeyAndVisible()
        
        
        return true
    }


}

