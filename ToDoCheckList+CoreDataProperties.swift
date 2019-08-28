//
//  ToDoCheckList+CoreDataProperties.swift
//  EpicuriousClone
//
//  Created by Tringapps on 27/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//
//

import Foundation
import CoreData


extension ToDoCheckList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoCheckList> {
        return NSFetchRequest<ToDoCheckList>(entityName: "ToDoCheckList")
    }

    @NSManaged public var checkListItemName: String?
    @NSManaged public var checkListItemIsPurchased: Bool

}
