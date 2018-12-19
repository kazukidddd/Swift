//
//  ViewController.swift
//  Swift5tableView1
//
//  Created by 木村和貴 on 2018/12/19.
//  Copyright © 2018 kazuki kimura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var box = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func countUp(_ sender: Any) {
        
        box = box + 1
        
        //キャストしている
        label.text = String(box)
        
        if box > 10 {
            
            //画面遷移させるコードを記述する
            let viewController2: ViewController2 = self.storyboard?.instantiateViewController(withIdentifier: "next") as! ViewController2
            
            viewController2.count = box
            self.navigationController?.pushViewController(viewController2, animated: true)
            
        }
        
    }
    
}

