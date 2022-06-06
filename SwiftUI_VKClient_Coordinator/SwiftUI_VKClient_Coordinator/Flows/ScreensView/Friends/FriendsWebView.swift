//
//  FriendsWebView.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 29.05.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct FriendsWebView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: FriendsViewModel
    @ObservedObject var loginViewModel: LoginViewModel
    
    // MARK: - Inits
    
    init(viewModel: FriendsViewModel, loginViewModel: LoginViewModel) {
        self.viewModel = viewModel
        self.loginViewModel = loginViewModel
    }
    
    // MARK: - Body view
    
    var body: some View {
        List(viewModel.friends.sorted(by: { $0.fullName < $1.fullName}), id: \.id) { friend in
            NavigationLink(destination: PhotosWebView(viewModel: PhotosViewModel(service: PhotosServiceRequest(viewModel: loginViewModel), friend: friend))) {
                AvatarImageViewBuilder {
                    WebImage(url: URL(string: friend.avatarImage))
                }
                TextBuilder {
                    Text(friend.fullName)
                }
            }
        }
        .onAppear { viewModel.fetch() }
        .navigationTitle("Friends")
        .navigationBarTitleDisplayMode(.inline)
    }
}

