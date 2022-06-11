//
//  GroupsResponse.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 27.05.2022.
//

import Foundation

struct GroupsResponse: Codable {
    var response: WebGroupResponse
}

struct WebGroupResponse: Codable {
    var count: Int
    var items: [GroupItems]
}

struct GroupItems: Codable {
    var id: Int
    var title: String
    var photo50: String?
    var type: String
    var membersCount: Int?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "name"
        case photo50 = "photo_50"
        case type
        case membersCount
    }
}
