//
//  FriendsResponse.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 27.05.2022.
//

import Foundation

struct FriendsResponse: Codable {
    var response: WebFriendsResponse
}

struct WebFriendsResponse: Codable {
    var count: Int
    var items: [Items]
}

struct Items: Codable {
    var id: Int
    var firstName: String
    var lastName: String
    var photo100: String?
    var trackCode: String
    let online: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo100 = "photo_100"
        case trackCode = "track_code"
        case online
    }
}
