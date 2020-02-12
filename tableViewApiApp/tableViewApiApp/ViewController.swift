//
//  ViewController.swift
//  tableViewApiApp
//
//  Created by 木村和貴 on 2020/02/12.
//  Copyright © 2020 kazuki kimura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var articles: [[String: Any]] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchArticles()
        
        
        // Do any additional setup after loading the view.
    }
    
    private func fetchArticles() {
        guard let url: URL = URL(string: "http://qiita.com/api/v2/items") else { return }
        let task: URLSessionTask = URLSession.shared.dataTask(with: url, completionHandler: {data, response, error in
            do {
                guard let data = data else { return }
                guard let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [Any] else { return }
                let articles = json.flatMap { (article) -> [String: Any]? in
                    return article as? [String: Any]
                }
                DispatchQueue.main.async {
                    self.articles = articles
                }
            }
            catch {
                print(error)
            }
        })
        task.resume() //実行する
    }
    
    private func initTableView() {
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }


}

extension ViewController: UITableViewDataSource {

    // セクションの個数を返す
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // セクションごとにセルの個数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    // セルの中身を返す
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        let article = articles[indexPath.row]
        let title = article["title"] as? String ?? "" // nil合体演算子を使用
        cell.bindData(text: "title: \(title)")
        return cell
    }

    // セルの高さを返す
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension ViewController: UITableViewDelegate {

    // セルがタップされたときの処理を書く
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("section: \(indexPath.section) index: \(indexPath.row)")
    }

    // スクロールしたときの処理を書く
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        return
    }
}

