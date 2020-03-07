//
//  CollectionViewCell.swift
//  CollectionViewApp
//
//  Created by 木村和貴 on 2020/03/07.
//  Copyright © 2020 kazuki kimura. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundImageView.layer.cornerRadius = 12
    }

}
