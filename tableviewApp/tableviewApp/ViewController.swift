//
//  ViewController.swift
//  tableviewApp
//
//  Created by 木村和貴 on 2020/02/03.
//  Copyright © 2020 kazuki kimura. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table:UITableView!
    
    // section毎の画像配列
    let imgArray1: NSArray = ["img0","img1"]
    let imgArray2: NSArray = ["img2","img3", "img4","img5","img6"]
    let imgArray3: NSArray = ["img7"]
    
    
    // section毎のラベルのarray
    let labelArray1: NSArray = ["8/23/ 16:04","8/23/ 16:15"]
    let labelArray2: NSArray = ["8/23/ 16:47","8/23/ 17:10",
                                "8/23/ 17:15","8/23/ 17:21","8/23/ 17:33"]
    let labelArray3: NSArray = ["8/23/ 17:41"]
    
    // Sectionのタイトル
    let sectionTitle: NSArray = [
        "SkyTree 快晴: 嵐の前の静けさ",
        "暴風雨: The storm is raging.",
        "嘘のような快晴: The storm has blown over."]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.bounces = false
    }
    
    // Section数
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    // Sectioのタイトル
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section] as? String
    }
    
    // Table Viewのセルの数を指定
    func tableView(_ table: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return imgArray1.count
        }
        else if section == 1 {
            return imgArray2.count
        }
        else if section == 2 {
            return imgArray3.count
        }
        else{
            return 0
        }
    }
    
    //各セルの要素を設定する
    func tableView(_ table: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // tableCell の ID で UITableViewCell のインスタンスを生成
        let cell = table.dequeueReusableCell(withIdentifier: "tableCell",
                                             for: indexPath)
        
        // Section毎に処理を分ける、ちょっと冗長的です
        if indexPath.section == 0 {
            print("indexPath.section == 0")
            
            let img = UIImage(named:imgArray1[indexPath.row] as! String)
            // Tag番号 1 で UIImageView インスタンスの生成
            let imageView = cell.viewWithTag(1) as! UIImageView
            imageView.image = img
            
            // Tag番号 ２ で UILabel インスタンスの生成
            let label = cell.viewWithTag(2) as! UILabel
            label.text = String(describing: labelArray1[indexPath.row])
        }
        else if indexPath.section == 1 {
            print("indexPath.section == 1")
            let img = UIImage(named:imgArray2[indexPath.row] as! String)
            // Tag番号 1 で UIImageView インスタンスの生成
            let imageView = cell.viewWithTag(1) as! UIImageView
            imageView.image = img
            
            // Tag番号 ２ で UILabel インスタンスの生成
            let label = cell.viewWithTag(2) as! UILabel
            label.text = String(describing: labelArray2[indexPath.row])
        }
        else if indexPath.section == 2 {
            print("indexPath.section == 2")
            let img = UIImage(named:imgArray3[indexPath.row] as! String)
            // Tag番号 1 で UIImageView インスタンスの生成
            let imageView = cell.viewWithTag(1) as! UIImageView
            imageView.image = img
            
            // Tag番号 ２ で UILabel インスタンスの生成
            let label = cell.viewWithTag(2) as! UILabel
            label.text = String(describing: labelArray3[indexPath.row])
        }
        
        return cell
    }
    
    func tableView(_ table: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

