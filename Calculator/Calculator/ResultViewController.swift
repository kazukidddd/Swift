//
//  ResultViewController.swift
//  Calculator
//
//  Created by 木村和貴 on 2020/02/16.
//  Copyright © 2020 kazuki kimura. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var result = 0
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = String(result)

        // Do any additional setup after loading the view.
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
