//
//  Appointments+CoreDataProperties.swift
//  PetKeeper
//
//  Created by Carolyn Chen on 5/8/20.
//  Copyright © 2020 Carolyn Chen. All rights reserved.
//
//

import Foundation
import CoreData


extension Appointments {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Appointments> {
        return NSFetchRequest<Appointments>(entityName: "Appointments")
    }

    @NSManaged public var date: String?
    @NSManaged public var detail: String?

}
