//
//  ViewController.swift
//  Swift5ImageView1
//
//  Created by 木村和貴 on 2018/12/17.
//  Copyright © 2018 kazuki kimura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
   
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func changeImage(_ sender: Any) {
        
        count = count + 1
        
        //押した時のアクション
        
        //もし　tapが10回されたら、
        //imageViewのimageをbackgroundに変える
        
        if count == 10 {
            
            imageView.image = UIImage(named:"background")
        }else if (count > 19){
            
            imageView.image = UIImage(named:"beach")
            count = 0 
        }
    }
    
}

