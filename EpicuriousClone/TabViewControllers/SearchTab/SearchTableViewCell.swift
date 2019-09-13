//
//  SearchTableViewCell.swift
//  EpicuriousClone
//
//  Created by Tringapps on 11/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var keywordTitle: UILabel!
    public static let reusableIdentity:String = "searchTableViewCellReusableIdentity"
    fileprivate var keywordList:[String] = []
    fileprivate var row:Int!
    weak var parentViewController:UIViewController!
    public func setValues(parent:UIViewController, data:SearchTabDecodableDataModel, displayingRow:Int) {
        keywordTitle.text = data.title
        self.keywordList = data.keywords
        collectionView.dataSource = self
        collectionView.delegate = self
        self.row = displayingRow
        self.parentViewController = parent
    }
}

extension SearchTableViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keywordList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InnerKeywordCollectionViewCell.reusableIdentity, for: indexPath) as! InnerKeywordCollectionViewCell
        cell.setValues(keyword: keywordList[indexPath.row], row: self.row)
        return cell
    }
}

extension SearchTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! InnerKeywordCollectionViewCell
        guard let searchTabViewController = parentViewController as? SearchTabViewController else {
            print("ParentViewController is not SearchTabViewController")
            return
        }
        searchTabViewController.searchBar.text = selectedCell.keywordLabel.text!
    }
}
