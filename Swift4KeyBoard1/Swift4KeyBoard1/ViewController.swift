//
//  ViewController.swift
//  Swift4KeyBoard1
//
//  Created by 木村和貴 on 2018/12/18.
//  Copyright © 2018 kazuki kimura. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate  {

    @IBOutlet var mailTextField: UITextField!
    
    @IBOutlet var passwadoTextField: UITextField!
    
    @IBOutlet var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mailTextField.delegate = self
        passwadoTextField.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //キーボードを閉じる
        textField.resignFirstResponder()
        
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        mailTextField.resignFirstResponder()
        passwadoTextField.resignFirstResponder()
        
    }

    @IBAction func signIn(_ sender: Any) {
        
        //結果にmailTextFieldの値とpasswordTextFieldの値を足し算して表示する
        
        resultLabel.text = mailTextField.text! + " " + passwadoTextField.text!
        
    }
    
}

