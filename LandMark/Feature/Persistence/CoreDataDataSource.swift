//
//  CoreDataDataSource.swift
//  LandMark
//
//  Created by Lucas Migge on 31/10/24.
//

import CoreData

protocol CoreDataDataSourceProtocol {
    associatedtype Entity = NSManagedObject
    func create(_ entity: Entity)
    func fetchAll() -> [Entity]
    func fetch(byID id: NSManagedObjectID) -> Entity?
    func update(_ entity: Entity)
    func delete(_ entity: Entity)
}

class CoreDataDataSource<T: NSManagedObject>: CoreDataDataSourceProtocol {
    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
        self.context = context
    }
    
    func create(_ entity: T) {
        context.insert(entity)
        saveContext()
    }
    
    func fetchAll() -> [T] {
        let request = T.fetchRequest()
        do {
            return try context.fetch(request) as? [T] ?? []
        } catch {
            print("Error fetching data: \(error)")
            return []
        }
    }
    
    func fetch(byID id: NSManagedObjectID) -> T? {
        return context.object(with: id) as? T
    }
    
    func update(_ entity: T) {
        saveContext()
    }
    
    func delete(_ entity: T) {
        context.delete(entity)
        saveContext()
    }
    
    private func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Failed to save context: \(error)")
            }
        }
    }
}
