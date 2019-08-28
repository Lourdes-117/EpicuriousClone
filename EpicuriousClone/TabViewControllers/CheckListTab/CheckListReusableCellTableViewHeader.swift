//
//  CheckListReusableCellTableViewHeader.swift
//  EpicuriousClone
//
//  Created by Tringapps on 28/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class CheckListReusableCellTableViewHeader: UITableViewCell {

    @IBOutlet weak var numberOfItems: UIButton!
    @IBOutlet weak var headerTitle: UILabel!

    fileprivate weak var checkListViewController: CheckListViewController!
    static let reusableIdentity:String = "CheckListHeaderReusableIdentity"

    public func setContext(ofParent parent:CheckListViewController) {
        self.checkListViewController = parent
    }

    @IBAction func onClickClearButton(_ sender: Any) {
        let title:String = "Are you sure?"
        let message:String = "Do you want to delete these items from your shopping list?"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = "Cancel"
        let delete = "Delete"
        let cancelButton  = UIAlertAction(title: cancel, style: .cancel, handler: nil)
        let deleteButton:UIAlertAction!

        if(headerTitle.text == Constants.CheckListTab.UNPURCHASED) {

            deleteButton = UIAlertAction(title: "\(delete) \(checkListViewController.incompleteTasksArray.count) items", style: .destructive) {
                (button) in
                for entry in self.checkListViewController.incompleteTasksArray {
                    let indexToRemove:Int = CheckListViewController.allTasksArray.firstIndex(of: entry)!
                    let elementToRemove:ToDoCheckList = CheckListViewController.allTasksArray[indexToRemove]
                    CheckListViewController.allTasksArray.remove(at: indexToRemove)
                    PersistentService.context.delete(elementToRemove)
                    self.checkListViewController.seperateData()
                    self.checkListViewController.tasksTableView.reloadData()
                }
            }
        } else {
            deleteButton = UIAlertAction(title: "\(delete) \(checkListViewController.completedTasksArray.count) items", style: .destructive) { (button) in
                for entry in self.checkListViewController.completedTasksArray {
                    let indexToRemove:Int = CheckListViewController.allTasksArray.firstIndex(of: entry)!
                    let elementToRemove:ToDoCheckList = CheckListViewController.allTasksArray[indexToRemove]
                    CheckListViewController.allTasksArray.remove(at: indexToRemove)
                    PersistentService.context.delete(elementToRemove)
                    self.checkListViewController.seperateData()
                    self.checkListViewController.tasksTableView.reloadData()
                }
            }
        }
        alert.addAction(cancelButton)
        alert.addAction(deleteButton)
        checkListViewController.present(alert, animated: true, completion: nil)
    }
}
