//
//  GroupsCoreData.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 27.05.2022.
//

import Foundation
import CoreData

@objc(GroupsCoreData)
final class GroupsCoreData: NSManagedObject, Identifiable {
    
    @NSManaged public var id: UUID
    @NSManaged public var groupName: String
    @NSManaged public var groupImageUrl: String
    
    @nonobjc public class func create(in context: NSManagedObjectContext,
                                      groupName: String,
                                      groupImageUrl: String?) throws {
        let group = GroupsCoreData(context: context)
        group.id = UUID()
        group.groupName = groupName
        group.groupImageUrl = groupImageUrl ?? "default"
        try context.save()
    }

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GroupsCoreData> {
        return NSFetchRequest<GroupsCoreData>(entityName: "Groups")
    }

}

extension Groups {
    func convertGroupsCoreData() -> UserModel {
        UserModel(fullName: groupName!, avatarImage: groupImageUrl!, friendPhotos: 0)
    }
}

