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
    weak var superViewController:UIViewController!
    @IBOutlet weak var collectionView: UICollectionView!
    var allRecipies:[NewestRecipiesDecodableDataModel]!

    public func setValues(recipies:[NewestRecipiesDecodableDataModel], parent:UIViewController) {
        self.allRecipies = recipies
        self.superViewController = parent
        collectionView.dataSource = self
        collectionView.delegate = self
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: parent.view.frame.width/2, height: (parent.view.frame.width/2)+70)
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
        if let _ = superViewController as? NewestRecipeDescriptionViewController {
            MoreRecipiesCollectionViewTableViewCell.selectedIndex = indexPath.row
            let selectedCell = collectionView.cellForItem(at: indexPath) as! MoreRecipeCollectionViewCell
            let tap = CGPoint(x: 0, y: 0)
            let point:CGPoint = selectedCell.recipeImage.convert(tap, to: superViewController.view)
            ScaleSegue.startFrameToAnimate = CGRect(x: point.x, y: point.y, width: selectedCell.recipeImage.frame.width, height: selectedCell.recipeImage.frame.height)
//            superViewController.performSegue(withIdentifier: segueIdentifier, sender: superViewController)
        } else {
            let newestRecipeDescriptionViewController = UIStoryboard.init(name: "HomeTab", bundle: Bundle.main).instantiateViewController(withIdentifier: Constants.ViewControllers.NEWEST_RECIPIES_DESCRIPTION) as! NewestRecipeDescriptionViewController
            newestRecipeDescriptionViewController.allRecipies = self.allRecipies
            newestRecipeDescriptionViewController.selectedIndex = indexPath.row
            if let navigationController = superViewController.navigationController {
                navigationController.pushViewController(newestRecipeDescriptionViewController, animated: true)
            } else {
                superViewController.present(newestRecipeDescriptionViewController, animated: true, completion: nil)
            }
        }
    }
}
