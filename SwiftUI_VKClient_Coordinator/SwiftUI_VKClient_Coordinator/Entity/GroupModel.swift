//
//  GroupModel.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 21.05.2022.
//

import Foundation
import UIKit

struct GroupModel: Identifiable {
    
    internal init(groupName: String, groupImage: String) {
        self.groupName = groupName
        self.groupImage = groupImage
    }
    
    let id = UUID()
    let groupName: String
    let groupImage: String

}

// Model without a network

//let groupData = [
//    GroupModel(groupName: "Barbados", groupImage: "Barbados"),
//    GroupModel(groupName: "Central Perk", groupImage: "CentralPerk")
//    ]
