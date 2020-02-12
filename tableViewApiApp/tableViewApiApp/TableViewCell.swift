//
//  TableViewCell.swift
//  tableViewApiApp
//
//  Created by 木村和貴 on 2020/02/12.
//  Copyright © 2020 kazuki kimura. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func  bindData(text: String) {
        label.text = text
    }
    
}
