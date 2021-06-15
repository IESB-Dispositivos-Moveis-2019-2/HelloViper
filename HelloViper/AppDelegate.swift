//
//  AppDelegate.swift
//  HelloViper
//
//  Created by Pedro Henrique on 14/06/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let router = LoginRouter()
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let window = application.windows.first ?? UIWindow(frame: UIScreen.main.bounds)
        router.present(on: window)
        self.window = window
        self.window?.makeKeyAndVisible()
        
        return true
    }


}

