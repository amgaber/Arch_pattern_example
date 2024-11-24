//
//  AppDelegate.swift
//  Arch_pattern_example
//
//  Created by Alaa Gaber on 24/11/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let taskListVC = ViewController()
                let navigationController = UINavigationController(rootViewController: taskListVC)
                window?.rootViewController = navigationController
                window?.makeKeyAndVisible()
        
        return true
    }


}

