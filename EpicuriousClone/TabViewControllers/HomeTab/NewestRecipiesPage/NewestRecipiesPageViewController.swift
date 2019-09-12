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
    var selectedIndex:Int = 0
    let dispatchGroup = DispatchGroup()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Newest Recipies Page View Loaded")
        recipiesCollectionView.dataSource = self
        recipiesCollectionView.delegate = self
        initializeData()
        dispatchGroup.notify(queue: .main, execute: {
            self.refreshViewController()
        })
        setCollectionViewCellSize()
    }

    fileprivate func setCollectionViewCellSize() {
        let layout = recipiesCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: view.frame.width/2, height: (view.frame.width/2)+70)
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

extension NewestRecipiesPageViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        let selectedCell = collectionView.cellForItem(at: indexPath) as! RecipeCollectionViewCell

        let tap = CGPoint(x: 0, y: 0)
        let point:CGPoint = selectedCell.recipeImage.convert(tap, to: self.view)
        ScaleSegue.startFrameToAnimate = CGRect(x: point.x, y: point.y, width: selectedCell.recipeImage.frame.width, height: selectedCell.recipeImage.frame.height)

        performSegue(withIdentifier: segueIdentifier, sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let newestRecipeDescriptionViewController = segue.destination as? NewestRecipeDescriptionViewController else {return}
        newestRecipeDescriptionViewController.allRecipies = self.recipesDataToDisplay
        newestRecipeDescriptionViewController.selectedIndex = self.selectedIndex
    }

    @IBAction func unwindToNewestRecipiesViewController(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {}
}
