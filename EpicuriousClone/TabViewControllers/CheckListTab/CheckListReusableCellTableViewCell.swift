//
//  CheckListReusableCellTableViewCell.swift
//  EpicuriousClone
//
//  Created by Tringapps on 27/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit
import CoreData

class CheckListReusableCellTableViewCell: UITableViewCell {
    @IBOutlet weak var checkListItemName: UITextField!
    @IBOutlet weak var checkListItemStatus: UIImageView!
    weak var selectedTask:ToDoCheckList!
    static let reusableIdentity:String = "CheckListCellReusableIdentity"
    var checkListViewController:CheckListViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        checkListItemName.delegate = self
    }

    public func setValues(data dataOptional:ToDoCheckList?, ofContext context:CheckListViewController) {
        checkListViewController = context
        guard let data = dataOptional else {
            checkListItemStatus.image = UIImage(named: Constants.Images.ADD_TASK)
            checkListItemName.text = ""
            checkListItemName.placeholder = "Add Ingredient"
            checkListItemName.isEnabled = true
            return
        }
        selectedTask = data
        checkListItemName.text = data.checkListItemName
        if(CheckListViewController.isEditingEnabled) {
            checkListItemStatus.image = UIImage(named: Constants.Images.DELETE_TASK)
            checkListItemName.isEnabled = true
        } else if(data.checkListItemIsPurchased) {
            checkListItemStatus.image = UIImage(named: Constants.Images.TASK_COMPLETED)
            checkListItemName.isEnabled = false
        } else {
            checkListItemStatus.image = UIImage(named: Constants.Images.TASK_INCOMPLETE)
            checkListItemName.isEnabled = false
        }
    }

    fileprivate func saveNewEntryInCoreData() {
        let newTask = ToDoCheckList(context: PersistentService.context)
        newTask.checkListItemIsPurchased = false
        newTask.checkListItemName = checkListItemName.text!
        CheckListViewController.allTasksArray.append(newTask)
        checkListViewController.seperateData()
        PersistentService.saveContext()
        checkListViewController.tasksTableView.reloadData()
        self.endEditing(true)
    }

    fileprivate func editEntryInCoreData() {
        let indexToModify = CheckListViewController.allTasksArray.firstIndex(of: selectedTask)
        let entryToModify:ToDoCheckList = CheckListViewController.allTasksArray[indexToModify!]
        entryToModify.checkListItemName = checkListItemName.text!
        PersistentService.saveContext()
    }
}

extension CheckListReusableCellTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(CheckListViewController.isEditingEnabled) {
            editEntryInCoreData()
        } else {
            saveNewEntryInCoreData()
        }
        self.endEditing(true)
        return true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(!checkListItemName.isEnabled) {
            let indexToModify:Int = CheckListViewController.allTasksArray.firstIndex(of: selectedTask)!
            print(indexToModify)
            let itemToModify:ToDoCheckList = CheckListViewController.allTasksArray[indexToModify]
            itemToModify.checkListItemIsPurchased = !itemToModify.checkListItemIsPurchased
            PersistentService.saveContext()
            checkListViewController.seperateData()
            checkListViewController.tasksTableView.reloadData()
        }
    }
}

