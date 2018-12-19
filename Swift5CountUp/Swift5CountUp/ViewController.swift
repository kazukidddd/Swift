//
//  ViewController.swift
//  Swift5CountUp
//
//  Created by 木村和貴 on 2018/12/17.
//  Copyright © 2018 kazuki kimura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count = 0
    
    @IBOutlet var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func plus(_ sender: Any) {
        
        count = count + 1
        
        label.text = String(count)
    }
    
    @IBAction func minus(_ sender: Any) {
        
        count = count - 1
        
        label.text = String(count)
        
        if count < 0{
            count = 0
            label.text = String(count)
        }
        
    }
}

