//
//  RecipeDescriptionViewController.swift
//  EpicuriousClone
//
//  Created by Tringapps on 26/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class RecipeDescriptionViewController: UIViewController {
    @IBOutlet weak var thicknessCollectionView: UICollectionView!
    @IBOutlet weak var cookingDeepnessCollectionView: UICollectionView!
    var thicknessArray:[String] = []
    var cookingDeepnessArray:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        thicknessCollectionView.dataSource = self
        cookingDeepnessCollectionView.dataSource = self
        print("Recipe Description Page Loaded")
    }
}

extension RecipeDescriptionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView.tag == 0) {
            return thicknessArray.count
        } else {
            return cookingDeepnessArray.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView.tag == 0) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThinknessReusableCollectionViewCell.reusableCellIdentity, for: indexPath) as! ThinknessReusableCollectionViewCell
            cell.setText(thicknessArray[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CookingDeepnessReusableCollectionViewCell.reusableCellIdentity, for: indexPath) as! CookingDeepnessReusableCollectionViewCell
            cell.setText(cookingDeepnessArray[indexPath.row])
            return cell
        }
    }
}
