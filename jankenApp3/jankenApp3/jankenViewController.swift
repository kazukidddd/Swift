//
//  jankenViewController.swift
//  jankenApp3
//
//  Created by 木村和貴 on 2019/01/08.
//  Copyright © 2019 kazuki kimura. All rights reserved.
//

import UIKit

class jankenViewController: UIViewController {

    let image0 = UIImage(named: "goo")!
    let image1 = UIImage(named: "par")!
    let image2 = UIImage(named: "choki")!
    
    let gooButton = UIButton()
    let parButton = UIButton()
    let chokiButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        グー
        gooButton.frame = CGRect(x:50, y:500, width:75, height:75)
        gooButton.setImage(image0, for: .normal)
        gooButton.addTarget(self, action: #selector(jankenViewController.gooButtonTapped(sender:)),
                            for: .touchUpInside)
        
        self.view.addSubview(gooButton)
        
//        パー
        parButton.frame = CGRect(x:150, y:500, width:75, height:75)
        parButton.setImage(image1, for: .normal)
        parButton.addTarget(self, action: #selector(jankenViewController.parButtonTapped(sender:)),
                            for: .touchUpInside)
        
        self.view.addSubview(parButton)
        
//        チョキ
        chokiButton.frame = CGRect(x:250, y:500, width:75, height:75)
        chokiButton.setImage(image2, for: .normal)
        chokiButton.addTarget(self, action: #selector(jankenViewController.chokiButtonTapped(sender:)),
                              for: .touchUpInside)
        
        self.view.addSubview(chokiButton)

        // Do any additional setup after loading the view.
    }
    
    @objc func gooButtonTapped(sender : AnyObject){
        let num = arc4random() % 3
        var nextvc : UIViewController = UIViewController()
        
        if(num == 0){
            nextvc = drawViewController()
        }else if(num == 1){
            nextvc = loseViewController()
        }else if(num == 2){
            nextvc = victoryViewController()
        }
        
        self.view.addSubview(gooButton)
        self.gooButton.center = self.view.center
        UIView.animate(withDuration: 1.0, delay: 0.0, options:[.curveEaseIn, .autoreverse], animations: {
            self.gooButton.center.x -= 100.0
        }, completion: {
            finished(self.present(nextvc, animated: true, completion: nil))
        })
        
        print(num)
        
    }
    
    @objc func parButtonTapped(sender : AnyObject){
        let num = arc4random() % 3
        var nextvc : UIViewController = UIViewController()
        
        if(num == 0){
            nextvc = victoryViewController()
        }else if(num == 1){
            nextvc = drawViewController()
        }else if(num == 2){
            nextvc = loseViewController()
        }
        self.view.addSubview(parButton)
        
        parButton.alpha = 0.0
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.curveEaseIn], animations: {
            self.parButton.alpha = 0.0}, completion: nil)
        
        print(num)
        self.present(nextvc, animated: true, completion: nil)
    }


    @objc func chokiButtonTapped(sender : AnyObject){
        let num = arc4random() % 3
        var nextvc : UIViewController = UIViewController()
        
        if(num == 0){
            nextvc = loseViewController()
        }else if(num == 1){
            nextvc = victoryViewController()
        }else if(num == 2){
            nextvc = drawViewController()
        }
        self.view.addSubview(chokiButton)
        
        
        print(num)
        self.present(nextvc, animated: true, completion: nil)
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
