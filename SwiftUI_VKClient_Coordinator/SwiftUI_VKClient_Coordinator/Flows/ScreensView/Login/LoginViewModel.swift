//
//  LoginViewModel.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 05.06.2022.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var isAutorized: Bool = false
    @Published var token: String = ""
    @Published var userId: String = ""
    @Published var version = "5.131"
    @Published var clientId = "7822904"

}
