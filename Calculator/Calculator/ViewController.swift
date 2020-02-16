//
//  ViewController.swift
//  Calculator
//
//  Created by 木村和貴 on 2020/02/16.
//  Copyright © 2020 kazuki kimura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstText: UITextField!
    @IBOutlet weak var secondText: UITextField!
    @IBOutlet weak var segmentedcontrol: UISegmentedControl!
    @IBOutlet weak var resultText: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapCalculate(_ sender: Any) {
        // 計算ボタンをタップしたときに呼ばれる
        print("didtapcalculate")

        if self.firstText.text?.count == 0,
            self.secondText.text?.count == 0 {
            showAlert(title: "Error", message: "両方のテキストに文字を入れてください")
            return print("returnしました")
        } else if self.firstText.text?.count == 0 {
            showAlert(title: "Error", message: "上のテキストに文字を入れてください")
            return print("returnしました")
        } else if self.secondText.text?.count == 0 {
            showAlert(title: "Error", message: "下のテキストに文字を入れてください")
            return print("returnしました")
        }

        let first = Int(self.firstText.text ?? "")!
        let second = Int(self.secondText.text ?? "")!
        var result = 0

        switch segmentedcontrol.selectedSegmentIndex {
        case 0:
            // 足し算
            result = first + second
            break
        case 1:
            // 引き算
            result = first - second
            break
        case 2:
            // 掛け算
            result = first * second
            break
        case 3:
            // 割り算
            result = first / second
            break
        default:
            break
        }
        resultText.text = String(result)
        print(first)
        print(second)
        print(result)

        self.performSegue(withIdentifier: "ResultSegue", sender: result)

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let next = segue.destination as? ResultViewController
        let result = sender as! Int
        next?.result = result

    }

    func showAlert(title:String, message:String) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)

        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}

