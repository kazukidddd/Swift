//
//  AddViewController.swift
//  Swift5Todo1
//
//  Created by 木村和貴 on 2018/12/19.
//  Copyright © 2018 kazuki kimura. All rights reserved.
//

import UIKit

    //UITextFieldDelegate キーボードを出し入れしたりする
class AddViewController: UIViewController,UITextFieldDelegate {

    var array = [String]()
    
    @IBOutlet var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self

        
    }
    
    @IBAction func add(_ sender: Any) {
        
        //現在の配列を取り出す
        if UserDefaults.standard.object(forKey: "todo") != nil{
            array = UserDefaults.standard.object(forKey: "todo") as! [String]
        }
        
        //append全て取り出す
        array.append(textField.text!)
        //配列を保存
        UserDefaults.standard.set(array, forKey: "todo")
        
        //trueボタンを押した時に画面を戻すために前の画面に戻る
        self.navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //リターンキーが押されたときにキーボードを閉じる
        textField.resignFirstResponder()
        
        return true
    }
   

}
