//
//  UserModel.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 20.05.2022.
//

import Foundation
import UIKit

struct UserModel: Identifiable {
    
    internal init(fullName: String, avatarImage: String, friendPhotos: Int) {
        self.fullName = fullName
        self.avatarImage = avatarImage
        self.friendPhotos = friendPhotos
    }
    
    let id = UUID()
    let fullName: String
    let avatarImage: String
    let friendPhotos: Int

}

// Model without a network

//let userData = [
//    UserModel(fullName: "Monica Geller", avatarImage: "MAvatar", friendPhotos: [("M1"), ("M2"), ("M3"), ("M4") ]),
//    UserModel(fullName: "Rashel Green", avatarImage: "RAvatar", friendPhotos: [("R1"), ("R2"), ("R3"), ("R4")]),
//    UserModel(fullName: "Joe Tribbiani", avatarImage: "JAvatar", friendPhotos: [("J1"), ("J2"), ("J3"), ("J4")]),
//    UserModel(fullName: "Ross Geller", avatarImage: "RoAvatar", friendPhotos: [("Ro1"), ("Ro2"), ("Ro3"), ("Ro4")])
//    ]

