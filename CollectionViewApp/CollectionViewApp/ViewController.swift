//
//  ViewController.swift
//  CollectionViewApp
//
//  Created by 木村和貴 on 2020/03/07.
//  Copyright © 2020 kazuki kimura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var horizontalCollectionView: UICollectionView!

    var viewWidth: CGFloat!
    var viewHeight: CGFloat!
    var cellWidth: CGFloat!
    var cellHeight: CGFloat!
    var cellOffset: CGFloat!
    var navHeight: CGFloat!

    var photoArray = ["ny","italy","australia","france"]
    var titleArray = ["ニューヨーク","イタリア","オーストラリア","フランス"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.overrideUserInterfaceStyle = .light

        viewWidth = view.frame.width
        viewHeight = view.frame.height
        navHeight = self.navigationController?.navigationBar.frame.size.height

        horizontalCollectionView.delegate = self
        horizontalCollectionView.dataSource = self

        let nib = UINib(nibName: "CollectionViewCell", bundle: .main)
        horizontalCollectionView.register(nib, forCellWithReuseIdentifier: "cell")

        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }


}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell

        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 12
        cell.layer.shadowOpacity = 0.4
        cell.layer.shadowRadius = 12
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 8, height: 8)
        cell.layer.masksToBounds = false
        cell.titleLabel.text = "\(titleArray[indexPath.row])への旅"
        cell.dateLabel.text = "06/08~06/15"
        cell.backgroundImageView.image = UIImage(named: photoArray[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        cellWidth = viewWidth * (3/4)
        cellHeight = viewHeight * (2/4)
        cellOffset = viewWidth - cellWidth
        return CGSize(width: 50, height: 50)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: (viewWidth-250)/2, bottom: 0, right: 44+((viewWidth-250)/2))
    }
}

