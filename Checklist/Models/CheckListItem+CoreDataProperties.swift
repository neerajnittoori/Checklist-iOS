//
//  CheckListItem+CoreDataProperties.swift
//  Checklist
//
//  Created by Neeraj Kumar Nittoori on 1/30/22.
//
//

import Foundation
import CoreData


extension CheckListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CheckListItem> {
        return NSFetchRequest<CheckListItem>(entityName: "CheckListItem")
    }

    @NSManaged public var name: String?

}

extension CheckListItem : Identifiable {

}
