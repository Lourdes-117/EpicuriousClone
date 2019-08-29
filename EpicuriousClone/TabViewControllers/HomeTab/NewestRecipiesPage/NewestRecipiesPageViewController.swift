//
//  NewestRecipiesPageViewController.swift
//  EpicuriousClone
//
//  Created by Tringapps on 29/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class NewestRecipiesPageViewController: UIViewController {
    @IBOutlet weak var recipiesCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Newest Recipies Page View Loaded")
        recipiesCollectionView.dataSource = self
    }
}

extension NewestRecipiesPageViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = recipiesCollectionView.dequeueReusableCell(withReuseIdentifier: RecipeCollectionViewCell.reusableIdentity, for: indexPath) as! RecipeCollectionViewCell
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = recipiesCollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NewestRecipiesCollectionViewCell.reusableIdentity, for: indexPath) as! NewestRecipiesCollectionViewCell
        return cell
    }
}
