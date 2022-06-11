//
//  PhotosResponse.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 27.05.2022.
//

import Foundation

struct PhotosResponse: Codable {
    let response: WebPhotosResponse
}

struct WebPhotosResponse: Codable {
    let count: Int
    let items: [PhotosItems]
}

struct PhotosItems: Codable {
    let sizes: [PhotosSizes]
}

struct PhotosSizes: Codable {
    let url: String
    let type: String
}
