//
//  ViewController.swift
//  Swift5Todo1
//
//  Created by 木村和貴 on 2018/12/19.
//  Copyright © 2018 kazuki kimura. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate {
    
   
    @IBOutlet var tableView: UITableView!
    
    var resultArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //都度userDefaultsの中身を取り出したい
        if UserDefaults.standard.object(forKey: "todo") != nil{
            
            resultArray = UserDefaults.standard.object(forKey: "todo") as! [String]
        }
        
        //再度delegateメソッドが呼ばれることになる
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return resultArray.count
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = resultArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    //cellを削除する
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        //横にスライドしてdeleteする
        if editingStyle == .delete{
            
            //消したいcellの行番号で削除
            resultArray.remove(at: indexPath.row)
            
            //消したあとに配列に再度セット
            UserDefaults.standard.set(resultArray
                , forKey: "todo")
            
            //tableViewをリロード
            tableView.reloadData()
        }
    }

}

