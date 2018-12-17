//
//  ViewController.swift
//  Keisan
//
//  Created by 木村和貴 on 2018/12/17.
//  Copyright © 2018 kazuki kimura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //0の入ったcountという名前の変数を宣言しました
    var count = 0
    
    var minus = 0
    
    var kakezan = 0
    
    var warizan = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        //足し算
        count = 10
        
        count = 11
        
        count = count + 1
        
        //引き算
        minus = 10
        
        minus = minus - 5
        
        //掛け算
        kakezan = 10
        
        kakezan = kakezan * 10
        
        //割り算
        
        warizan = 10
        
        warizan = warizan / 2
    
        
        
    }


}

