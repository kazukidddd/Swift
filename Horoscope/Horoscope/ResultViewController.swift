//
//  ResultViewController.swift
//  Horoscope
//
//  Created by 木村和貴 on 2020/02/15.
//  Copyright © 2020 kazuki kimura. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ResultViewController: ViewController {

    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!

    var sign = 0

    override func viewDidLoad() {
        super.viewDidLoad()

//        nowDate = dateFormatter.string(from: now)

        self.getHoroscope()
        
    }
    
    func getHoroscope() {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy/MM/dd",
                                                            options: 0,
                                                            locale: Locale(identifier: "ja_JP"))
        let nowStr = dateFormatter.string(from: now)


        let requestURL = "http://api.jugemkey.jp/api/horoscope/free/" + nowStr
        request(requestURL).response { response in
//            debugPrint(response)
            if let jsonObject = response.data {
                let json = JSON(jsonObject)
                print(json)
                let result: JSON = json["horoscope"][nowStr][self.sign]
                print(result)
                let rank = result["rank"].stringValue
                let sign = result["sign"].stringValue
                let content = result["content"].stringValue
                self.rankLabel.text = rank
                self.signLabel.text = sign
                self.contentLabel.text = content


            }
            
        }
    }

}
