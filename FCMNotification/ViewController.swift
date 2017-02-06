//
//  ViewController.swift
//  FCMNotification
//
//  Created by Mukesh Jha on 03/02/17.
//  Copyright © 2017 Mukesh Jha. All rights reserved.
//

import UIKit
import Firebase
import FirebaseInstanceID
import FirebaseMessaging

class ViewController: UIViewController {
    let notificationName = Notification.Name("NotificationIdentifier");
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let token = FIRInstanceID.instanceID().token() {
            print("Token \(token)")
        }
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.methodOfReceivedNotification), name: notificationName, object: nil)
        
        
    }
    //    @IBAction func handleLogTokenTouch(_ sender: UIButton) {
    //        // [START get_iid_token]
    //        let token = FIRInstanceID.instanceID().token()
    //        print("InstanceID token: \(token!)")
    //        // [END get_iid_token]
    //    }
    
    func methodOfReceivedNotification(notification: Notification){
        print("Notification received")
        if let userInfo = notification.object as? [AnyHashable:Any] {
        if let aps = userInfo["aps"] as? NSDictionary {
            if let alert = aps["alert"] as? NSDictionary {
                if let message = alert["message"] as? NSString {
                    //Do stuff
                    print("Message : \(message)")
                    
                }
            } else if let alert = aps["alert"] as? NSString {
                //Do stuff
                print("Alert  : \(alert)")
                
                if let dec = userInfo["google.c.a.c_l"] as? NSString {
                    print("desc :  \(dec)")
                    
                }
            }
        
        }
        }
        
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    
    
    
    
    
    @IBAction func handleSubscribeTouch(_ sender: UIButton) {
        // [START subscribe_topic]
        FIRMessaging.messaging().subscribe(toTopic: "/topics/news")
        print("Subscribed to news topic")
        // [END subscribe_topic]
    }
    
}

