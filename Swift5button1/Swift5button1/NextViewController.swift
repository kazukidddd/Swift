//
//  NextViewController.swift
//  Swift5button1
//
//  Created by 木村和貴 on 2018/12/16.
//  Copyright © 2018 kazuki kimura. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
   
    @IBOutlet var changeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func change(_ sender: Any) {
        //ここが呼ばれる
        
        //次の画面へと書かれたラベルの文字を変更したい
        
        changeLabel.text = "暗号が解除されました"
        
    }
    

}
