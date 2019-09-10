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
    var superViewController:NewestRecipeDescriptionViewController!
    @IBOutlet weak var collectionView: UICollectionView!
    var allRecipies:[NewestRecipiesDecodableDataModel]!
    public func setValues(recipies:[NewestRecipiesDecodableDataModel], parent:NewestRecipeDescriptionViewController) {
        self.allRecipies = recipies
        self.superViewController = parent
        collectionView.dataSource = self
        collectionView.delegate = self
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

extension MoreRecipiesCollectionViewTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "HomeTab", bundle: nil)
        let secondViewController =  storyboard.instantiateViewController(withIdentifier: Constants.ViewControllers.NEWEST_RECIPIES_DESCRIPTION) as! NewestRecipeDescriptionViewController

        secondViewController.allRecipies = superViewController.allRecipies
        secondViewController.selectedIndex = indexPath.row
        guard let navigationController = superViewController.navigationController else {
            superViewController.present(secondViewController, animated: true)
            return
        }
        navigationController.pushViewController(secondViewController, animated: true)
    }
}
