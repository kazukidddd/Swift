//
//  ViewController.swift
//  Swift5button1
//
//  Created by 木村和貴 on 2018/12/16.
//  Copyright © 2018 kazuki kimura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //countという変数の中に5が入っています。
    //countという変数を下で使うことができるようになりました。
    var count = 5
    
    var moji = "あいうえお"
    
    //画面が表示されるときに最初に呼ばれる場所
    override func viewDidLoad() {
        super.viewDidLoad()
            //勝手に呼ばれる場所
        
        count = 10
        
        print(count)
         
    }


}

