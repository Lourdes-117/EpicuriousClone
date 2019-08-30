//
//  NewestRecipiesPageViewController.swift
//  EpicuriousClone
//
//  Created by Tringapps on 29/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class NewestRecipiesPageViewController: UIViewController {
    let segueIdentifier:String = "RecipeDescriptionSegueIdentifier"
    @IBOutlet weak var recipiesCollectionView: UICollectionView!
    var recipesDataToDisplay:[NewestRecipiesDecodableDataModel] = []
    let dispatchGroup = DispatchGroup()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Newest Recipies Page View Loaded")
        recipiesCollectionView.dataSource = self
        initializeData()
        dispatchGroup.notify(queue: .main, execute: {
            self.refreshViewController()
        })
    }
    fileprivate func initializeData() {
        let fileName:String = "HomeTabNewestRecipePageJSON"
        let fileExtension:String = "json"
        let urlObject = Bundle.main.url(forResource: fileName, withExtension: fileExtension)
        GetDataFromApi.getJsonArrayFromFile(fromFile: urlObject!, dispatchGroup: dispatchGroup) { (entries: [NewestRecipiesDecodableDataModel]) in
            self.recipesDataToDisplay = entries
        }
    }

    fileprivate func refreshViewController() {
        recipiesCollectionView.reloadData()
    }
}

extension NewestRecipiesPageViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipesDataToDisplay.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = recipiesCollectionView.dequeueReusableCell(withReuseIdentifier: RecipeCollectionViewCell.reusableIdentity, for: indexPath) as! RecipeCollectionViewCell
        cell.setValues(data: recipesDataToDisplay[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = recipiesCollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NewestRecipiesCollectionViewCell.reusableIdentity, for: indexPath) as! NewestRecipiesCollectionViewCell
        return cell
    }
}
