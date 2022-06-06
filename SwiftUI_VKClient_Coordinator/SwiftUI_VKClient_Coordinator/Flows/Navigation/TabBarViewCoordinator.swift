//
//  TabBarViewCoordinator.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 05.06.2022.
//

import SwiftUI

struct TabBarViewCoordinator: View {
    
    var viewModel: LoginViewModel
    
    var body: some View {
        TabView {
            FriendsWebView(viewModel: FriendsViewModel(service: FriendsServiceRequest(viewModel: viewModel)), loginViewModel: viewModel)
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Friends")
                }
            GroupsWebView(viewModel: GroupsViewModel(service: GroupsServiceRequest(viewModel: viewModel), coreDataService: CoreDataService(modelName: "ModelCoreData")))
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Groups")
                }
            NewsView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("News")
                }
        }
    }

}
