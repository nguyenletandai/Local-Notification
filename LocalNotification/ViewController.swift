//
//  ViewController.swift
//  LocalNotification
//
//  Created by Đại Nguyễn on 01/04/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didPressPushButton(_ sender: Any) {
        //1
        let content = UNMutableNotificationContent()
        content.title = "Welcome"
        content.subtitle = "You"
        content.body = "to DaiNLT's tutorial"
        content.badge = 1
        
        //2
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        //3
        let request = UNNotificationRequest(identifier: "identifier", content: content, trigger: trigger)
        
        //4
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
}

