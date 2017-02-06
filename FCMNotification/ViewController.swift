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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let token = FIRInstanceID.instanceID().token() {
           print("Token \(token)")
        }
        
    }
//    @IBAction func handleLogTokenTouch(_ sender: UIButton) {
//        // [START get_iid_token]
//        let token = FIRInstanceID.instanceID().token()
//        print("InstanceID token: \(token!)")
//        // [END get_iid_token]
//    }
    
    @IBAction func handleSubscribeTouch(_ sender: UIButton) {
        // [START subscribe_topic]
        FIRMessaging.messaging().subscribe(toTopic: "/topics/news")
        print("Subscribed to news topic")
        // [END subscribe_topic]
    }

}

