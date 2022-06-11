//
//  CoreDataService.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 27.05.2022.
//

import Foundation
import CoreData

class CoreDataService {
    
    // MARK: - Private properties
    
    private let modelName: String
    
    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: self.modelName)
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Unresolved error \(error), \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    // MARK: - Properties
    
    var context: NSManagedObjectContext { storeContainer.viewContext }
    
    // MARK: - Inits
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
//    func saveContext() throws {
//        guard context.hasChanges else { return }
//    }
    
    // MARK: - Methods
    
    func saveGroup(groupName: String, groupImageUrl: String) {
        let group = Groups(context: storeContainer.viewContext)
        group.groupName = groupName
        group.groupImageUrl = groupImageUrl
        
        do {
            try storeContainer.viewContext.save()
        } catch {
            print("Failed save \(error)")
        }
    }
    
    func getAllGroups() -> [Groups] {
        let fetchRequest: NSFetchRequest<Groups> = Groups.fetchRequest()
        do {
            return try storeContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
}
