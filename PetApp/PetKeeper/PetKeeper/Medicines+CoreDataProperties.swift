//
//  Medicines+CoreDataProperties.swift
//  PetKeeper
//
//  Created by Carolyn Chen on 5/8/20.
//  Copyright © 2020 Carolyn Chen. All rights reserved.
//
//

import Foundation
import CoreData


extension Medicines {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Medicines> {
        return NSFetchRequest<Medicines>(entityName: "Medicines")
    }

    @NSManaged public var name: String?
    @NSManaged public var date: String?

}
