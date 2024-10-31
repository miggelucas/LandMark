//
//  CDPin+CoreDataProperties.swift
//  LandMark
//
//  Created by Lucas Migge on 31/10/24.
//
//

import Foundation
import CoreData


extension CDPin {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDPin> {
        return NSFetchRequest<CDPin>(entityName: "CDPin")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var createdAt: Date?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double

}

extension CDPin : Identifiable {

}
