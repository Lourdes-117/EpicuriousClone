//
//  CheckListViewController.swift
//  EpicuriousClone
//
//  Created by Tringapps on 27/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit
import CoreData

class CheckListViewController: UIViewController {

    @IBOutlet weak var tasksTableView: UITableView!
    public static var allTasksArray:[ToDoCheckList] = []
    var completedTasksArray:[ToDoCheckList] = []
    var incompleteTasksArray:[ToDoCheckList] = []
    public static var isEditingEnabled:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tasksTableView.dataSource = self
        tasksTableView.delegate = self
        initializeData()
        print("CheckList View Loaded")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        seperateData()
    }

    fileprivate func initializeData() {
        let fetchRequest: NSFetchRequest<ToDoCheckList> = ToDoCheckList.fetchRequest()
        do {
            let toDoDataFromCoreData = try PersistentService.context.fetch(fetchRequest)
            CheckListViewController.allTasksArray.append(contentsOf: toDoDataFromCoreData)
        }
        catch {
            print("Error In Fetching Data From Core Data ")
        }
    }

    @IBAction func onClickEditButton(_ sender: Any) {
        CheckListViewController.isEditingEnabled = !CheckListViewController.isEditingEnabled
        tasksTableView.reloadData()
    }

    deinit {
        print("CheckList View Safe From Memory Leaks")
    }

    public func seperateData() {
        var incompleArray:[ToDoCheckList] = []
        var completedArray:[ToDoCheckList] = []
        for task in CheckListViewController.allTasksArray {
            if task.checkListItemIsPurchased {
                completedArray.append(task)
            } else {
                incompleArray.append(task)
            }
        }
        incompleteTasksArray.removeAll()
        completedTasksArray.removeAll()
        incompleteTasksArray = incompleArray
        completedTasksArray = completedArray
    }
}

extension CheckListViewController:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        let numberOfSections = 3
        return numberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
           return incompleteTasksArray.count
        case 1:
            if(CheckListViewController.isEditingEnabled) {
                return 0
            } else {
                return 1
            }
        case 2:
           return completedTasksArray.count;
        default:
            print("Internal Error: More Sections Found")
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CheckListReusableCellTableViewCell
        switch indexPath.section {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: CheckListReusableCellTableViewCell.reusableIdentity) as! CheckListReusableCellTableViewCell
            cell.setValues(data: incompleteTasksArray[indexPath.row], ofContext: self)
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: CheckListReusableCellTableViewCell.reusableIdentity) as! CheckListReusableCellTableViewCell
            cell.setValues(data: nil, ofContext: self)
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: CheckListReusableCellTableViewCell.reusableIdentity) as! CheckListReusableCellTableViewCell
            cell.setValues(data: completedTasksArray[indexPath.row], ofContext: self)
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: CheckListReusableCellTableViewCell.reusableIdentity) as! CheckListReusableCellTableViewCell
            print("Internal Error")
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard CheckListViewController.isEditingEnabled else {return}
        switch indexPath.section {
        case 0:
            tasksTableView.deleteRows(at: [indexPath], with: .top)
        case 1:
            print()
        case 2:
            tasksTableView.deleteRows(at: [indexPath], with: .top)
        default:
            print("Internal Error")
        }
        tableView.deleteRows(at: [indexPath], with: .left)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let unpurchased:String = "UNPURCHASED"
        let purchased:String = "PURCHASED"
        let item:String = "ITEM"
        let items:String = "ITEMS"
        let cell = tableView.dequeueReusableCell(withIdentifier: CheckListReusableCellTableViewHeader.reusableIdentity) as! CheckListReusableCellTableViewHeader
        cell.setContext(ofParent: self)
        switch section {
        case 0:
            cell.headerTitle.text = unpurchased
            var textToAppend:String = ""
            if(completedTasksArray.count < 2) {
                textToAppend = item
            } else {
                textToAppend = items
            }
            cell.numberOfItems.setTitle("\(incompleteTasksArray.count) \(textToAppend)", for: .disabled)
            cell.numberOfItems.isEnabled = false
            return cell
        case 2:
            cell.headerTitle.text = purchased
            var textToAppend:String = ""
            if(completedTasksArray.count < 2) {
                textToAppend = item
            } else {
                textToAppend = items
            }
            cell.numberOfItems.setTitle("\(completedTasksArray.count) \(textToAppend)", for: .disabled)
            cell.numberOfItems.isEnabled = false
            return cell
        default:
            return nil
        }
    }
}

extension CheckListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            if(incompleteTasksArray.count>0){return 45} else {return 0}
        case 1:
            return 0
        case 3:
            if(completedTasksArray.count>0){return 45} else {return 0}
        default:
            print("Internal Error")
        }
        return 45
    }
}
