//
//  FriendsService.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 27.05.2022.
//

import Foundation
import SwiftUI
import Alamofire

protocol FriendsService {
    func getFriends(completion: @escaping (FriendsResponse?) -> ())
}

class FriendsServiceRequest: FriendsService {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: LoginViewModel
    
    let baseUrl = "https://api.vk.com/method"
    var parameters: Parameters = [:]
    var request: String?
    
    // MARK: - Inits
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Methods
    
    func getFriends(completion: @escaping (FriendsResponse?) -> ()) {
        let method = "/friends.get"
        let url = baseUrl + method
        
        self.parameters = [
            "client_Id": viewModel.clientId,
            "user_Id": viewModel.userId,
            "access_token": viewModel.token,
            "v": viewModel.version
        ]
        
        parameters["extended"] = "1"
        parameters["fields"] = "photo_100, online"
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            self.request = response.request?.description
            guard let data = response.data else { return }
            
            do {
                let friends = try JSONDecoder().decode(FriendsResponse.self, from: data)
                completion(friends)
            } catch {
                print(error)
            }
        }
    }
    
}
