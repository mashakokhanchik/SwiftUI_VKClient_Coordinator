//
//  GroupsWebView.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 29.05.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct GroupsWebView: View {
    
    @ObservedObject var viewModel: GroupsViewModel
    
    init(viewModel: GroupsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(viewModel.groups.sorted(by: { $0.fullName < $1.fullName}), id: \.id) { group in
            HStack {
                AvatarImageViewBuilder {
                    WebImage(url: URL(string: group.avatarImage))
                }
                TextBuilder {
                    Text(group.fullName)
                }
            }
        }
        .onAppear { viewModel.chooseLoad() }
        .navigationTitle("Groups")
        .navigationBarTitleDisplayMode(.inline)
    }
}

