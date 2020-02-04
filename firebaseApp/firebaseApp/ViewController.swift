//
//  ViewController.swift
//  firebaseApp
//
//  Created by 木村和貴 on 2019/04/30.
//  Copyright © 2019 kazuki kimura. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet var displayAge: UILabel!
    @IBOutlet var ageText: UITextField!
    @IBOutlet var TextField: UITextField!
    var database = DatabaseReference()
    override func viewDidLoad() {
        super.viewDidLoad()
        database = Database.database().reference()
        // Do any additional setup after loading the view.
    }
   
    
    @IBAction func add(_ sender: Any) {
        let age:Int = Int(ageText.text!)!
        let name:String = String(TextField.text!)
        let data = ["name": name,"age": age] as [String : Any]
        database.child("user/01").setValue(data)
        
        let defaultPlace = database.child("user/01/age")
        defaultPlace.observe(.value) { (snap: DataSnapshot) in self.displayAge.text = (snap.value! as AnyObject).description
        }
    }
    @IBAction func updateButton(_ sender: Any) {
        let data = ["name": TextField.text!]
        database.child("user/01").updateChildValues(data)
        
    }
    @IBAction func remove(_ sender: AnyObject) {
        database.child("user/01/name").removeValue()
    }
    
}

