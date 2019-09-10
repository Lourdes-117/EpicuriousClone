//
//  MoreRecipiesCollectionViewTableViewCell.swift
//  EpicuriousClone
//
//  Created by Tringapps on 09/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class MoreRecipiesCollectionViewTableViewCell: UITableViewCell {
    public static var selectedIndex:Int = 0
    public static let reusableIdentity:String = "moreRecipiesCollectionViewCellReusableIdentity"
    fileprivate let segueIdentifier:String = "selfSegueIdentifier"
    var superViewController:UIViewController!
    @IBOutlet weak var collectionView: UICollectionView!
    var allRecipies:[NewestRecipiesDecodableDataModel]!
    public func setValues(recipies:[NewestRecipiesDecodableDataModel], parent:UIViewController) {
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
        print("\(allRecipies.count) elements are getting returned")
        return allRecipies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("CellForRowAt is being called Successfully")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreRecipeCollectionViewCell.reusableIdentity, for: indexPath) as! MoreRecipeCollectionViewCell
        cell.setValues(data: allRecipies[indexPath.row])
        return cell
    }
}

extension MoreRecipiesCollectionViewTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        MoreRecipiesCollectionViewTableViewCell.selectedIndex = indexPath.row
        let selectedCell = collectionView.cellForItem(at: indexPath) as! MoreRecipeCollectionViewCell
        let tap = CGPoint(x: 0, y: 0)
        let point:CGPoint = selectedCell.recipeImage.convert(tap, to: superViewController.view)
        ScaleSegue.startFrameToAnimate = CGRect(x: point.x, y: point.y, width: selectedCell.recipeImage.frame.width, height: selectedCell.recipeImage.frame.height)
        superViewController.performSegue(withIdentifier: segueIdentifier, sender: superViewController)
    }
}
