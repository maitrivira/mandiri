//
//  AppDelegate.swift
//  BankMandiri
//
//  Created by Maitri Vira on 11/10/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        let router = NewsHomeRouter.startExecution()
        let initialView = router.entity!
        
        let navigation = UINavigationController()
        navigation.viewControllers = [initialView]
        navigation.setNavbarColor()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = navigation
        return true
    }
}

