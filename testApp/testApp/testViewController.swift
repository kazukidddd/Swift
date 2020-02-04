//
//  testViewController.swift
//  testApp
//
//  Created by 木村和貴 on 2019/01/07.
//  Copyright © 2019 kazuki kimura. All rights reserved.
//

import UIKit

class testViewController: UIViewController {

    
    @IBOutlet var hello: UILabel!
    
    @IBOutlet var change: UIButton!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        hello.text = "Swift test"
        change.setTitle("Button", for: UIControl.State.normal)
        
    }

    @IBAction func buttonTapped(_ sender: Any) {
        count += 1
        if(count<=2){
            hello.text = "gorigori"
        }else{
            hello.text = "comeback!"
            count = 0
        }
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
