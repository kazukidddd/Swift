//
//  ViewController.swift
//  Swift4Manga2
//
//  Created by 木村和貴 on 2018/12/18.
//  Copyright © 2018 kazuki kimura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var countLabel: UILabel!
    
    @IBOutlet var runnerImageView: UIImageView!
    
    
    //配列の宣言
    var imageArray = [UIImage]()
    
    //タイマーの宣言
    var timer1 = Timer()
    
    var timer2 = Timer()
    
    var updateCount = 0
    
    //経過時間
    var countUp = 0
    
    @IBOutlet var runButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        countLabel.text = "0"
        
        let image0 = UIImage(named: "dash0.png")
        let image1 = UIImage(named: "dash1.png")
        let image2 = UIImage(named: "dash2.png")
        let image3 = UIImage(named: "dash3.png")
        let image4 = UIImage(named: "dash4.png")
        let image5 = UIImage(named: "dash5.png")
        
        imageArray = [image0!, image1!, image2!, image3!, image4!, image5!]
        
    }

    @IBAction func run(_ sender: Any) {
        
        //ボタンを一度押すと押せなくする
        runButton.isEnabled = false
        
        //タイマーをスタート
        timer1 = Timer.scheduledTimer(withTimeInterval: 1.0
            , repeats: true
            , block: { (timer) in
                
                
        //カウントアップ
            self.countUp = self.countUp + 1
                
        //ラベルに反映する   キャスト
            self.countLabel.text = String(self.countUp)
                
        })
        //runnerImageViewに画像を一秒ごとに反映させていく
        timer2 = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer) in
            
            //タンスの中から画像を取り出して、UIImageViewに反映していく
            
            if(self.updateCount > 5){
                
                self.updateCount = 0
                self.runnerImageView.image = UIImage(named: "dash0.png")
            }else{
                self.runnerImageView.image = self.imageArray[self.updateCount]
            }
            
            self.updateCount = self.updateCount + 1
        })
    }
    
    @IBAction func stop(_ sender: Any) {
        
        //ボタンを押せるようにする
        runButton.isEnabled = true
        
        timer1.invalidate()
        timer2.invalidate()
    }
    
}

