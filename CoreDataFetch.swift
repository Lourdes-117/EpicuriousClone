//
//  CoreDataFetch.swift
//  EpicuriousClone
//
//  Created by Tringapps on 27/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import Foundation
import CoreData
class CoreDataFetch {
    public static func fetchData(fetchRequest:NSFetchRequest<NSFetchRequestResult>) -> Any? {
        do {
            let dataFromCoreData = try PersistentService.context.fetch(fetchRequest)
            return dataFromCoreData
        }
        catch {
            print("Error In Fetching Data From Core Data ")
        }
        return nil
    }
}
