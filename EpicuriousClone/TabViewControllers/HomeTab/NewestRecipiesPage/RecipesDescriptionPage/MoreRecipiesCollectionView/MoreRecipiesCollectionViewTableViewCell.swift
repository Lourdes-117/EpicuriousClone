//
//  MoreRecipiesCollectionViewTableViewCell.swift
//  EpicuriousClone
//
//  Created by Tringapps on 09/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class MoreRecipiesCollectionViewTableViewCell: UITableViewCell {
    public static let reusableIdentity:String = "moreRecipiesCollectionViewCellReusableIdentity"
    @IBOutlet weak var collectionView: UICollectionView!
    var allRecipies:[NewestRecipiesDecodableDataModel]!
    public func setValues(recipies:[NewestRecipiesDecodableDataModel]) {
        print("Values are being set")
        self.allRecipies = recipies
        collectionView.dataSource = self
    }
}

extension MoreRecipiesCollectionViewTableViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allRecipies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreRecipeCollectionViewCell.reusableIdentity, for: indexPath) as! MoreRecipeCollectionViewCell
        cell.setValues(data: allRecipies[indexPath.row])
        return cell
    }
}
