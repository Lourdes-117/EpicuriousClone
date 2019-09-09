//
//  keywordCollectionViewTableViewCell.swift
//  EpicuriousClone
//
//  Created by Tringapps on 09/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class keywordCollectionViewTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    public static let reusableIdentity:String = "keywordCollectionViewTableViewCellReusableIdentity"
    var keywords:[String]!
    public func setValue(keywordArray:[String]) {
        self.keywords = keywordArray
        collectionView.dataSource = self
    }
}

extension keywordCollectionViewTableViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keywords.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: keywordCollectionViewCell.reusableIdentity, for: indexPath) as! keywordCollectionViewCell
        cell.setValue(keywordString: keywords[indexPath.row])
        return cell
    }
}
