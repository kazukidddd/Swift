//
//  ViewController3.swift
//  Swift5tableView1
//
//  Created by 木村和貴 on 2018/12/19.
//  Copyright © 2018 kazuki kimura. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
    
    @IBOutlet var label: UILabel!
    var count2 = 0
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        navigationController!.navigationBar.topItem!.title = "戻る"
        
        label.text = String(count2)
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
