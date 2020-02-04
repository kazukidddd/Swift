//
//  ViewController.swift
//  Swift5LocalPush1
//
//  Created by 木村和貴 on 2018/12/19.
//  Copyright © 2018 kazuki kimura. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func push(_ sender: Any) {
        
        //nameTextFieldとtextFieldをローカルプッシュ通知で飛ばしたい
        
        let content = UNMutableNotificationContent()
        content.title = nameTextField.text!
        content.body = textField.text!
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5
            , repeats: false)
        let request = UNNotificationRequest(identifier: "ID", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    
}

