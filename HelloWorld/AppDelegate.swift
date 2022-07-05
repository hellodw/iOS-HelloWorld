//
//  AppDelegate.swift
//  HelloWorld
//
//  Created by maverick.b on 2022/07/05.
//

import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIHostingController(rootView: MainView())
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}
