//
//  AppDelegate.swift
//  ESChecker
//
//  Created by Ryusei Hiraoka on 2021/03/11.
//

import UIKit
import NCMB

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let applicationkey = "585a27516a83bc76448fcceca40d6f4ef29f876bd912927016daa491aab0bb40"
        
        let clientkey = "eb7b1b540c010c14cf759b05ac539e7bc949902312a59bcec0ab0ac6895643ef"
        
        NCMB.setApplicationKey(applicationkey, clientKey: clientkey)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

