//
//  AppDelegate.swift
//  LocalNotification
//
//  Created by Đại Nguyễn on 01/04/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UNUserNotificationCenter.current().delegate = self
        registerForNotifications()
        setCategory()
        return true
    }
    
    func registerForNotifications() {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            }
    }
    
    func setCategory() {
        //1
        let action = UNNotificationAction(identifier: "JOIN", title: "Join", options: [])
        
        //2
        let category = UNNotificationCategory(identifier: "CATEGORY", actions: [action], intentIdentifiers: [], options: [])
        
        //3
        UNUserNotificationCenter.current().setNotificationCategories([category])
    }


}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .badge, .sound])
    }
}

