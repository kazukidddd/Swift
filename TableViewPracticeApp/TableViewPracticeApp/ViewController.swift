//
//  ViewController.swift
//  TableViewPracticeApp
//
//  Created by 木村和貴 on 2020/03/01.
//  Copyright © 2020 kazuki kimura. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let cellIdentifier = "UITableViewCell"

    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.overrideUserInterfaceStyle = .light
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        tableView.estimatedRowHeight = 66
        tableView.rowHeight = UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PersonStore.shared.count()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let p = PersonStore.shared.get(index: indexPath.row)

        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
            cell.addingText.text = p.name
            cell.indexText.text = "row:\(indexPath.row)"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            cell.textLabel?.text = p.name
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    @IBAction func addTapped(_ sender: Any) {
        var alertTextField: UITextField?

        let alert = UIAlertController(title: "edit Name", message: "Enter new name", preferredStyle: UIAlertController.Style.alert)
        alert.addTextField(
            configurationHandler: {(textField: UITextField!) in
                alertTextField = textField
        })
        alert.addAction(
            UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        )
        alert.addAction(
            UIAlertAction(
            title: "OK",
            style: UIAlertAction.Style.default) { _ in
                if let text = alertTextField?.text {
                    PersonStore.shared.add(Person(text))
                    try? PersonStore.shared.save()
                    self.tableView.reloadData()
                }
        }
        )
        self.present(alert,animated: true, completion: nil)
    }

    @IBAction func editTapped(_ sender: Any) {
        if(tableView.isEditing){
            tableView.setEditing(false, animated: true)
            editButton.setTitle("Edit", for: .normal)
            try? PersonStore.shared.save()
            self.tableView.reloadData()
        }else {
            tableView.setEditing(true, animated: true)
            editButton.setTitle("Done", for: .normal)
        }
    }

    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            PersonStore.shared.remove(indexPath.row)
            tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        PersonStore.shared.move(
            from: sourceIndexPath.row,
            to: destinationIndexPath.row)
    }

}

