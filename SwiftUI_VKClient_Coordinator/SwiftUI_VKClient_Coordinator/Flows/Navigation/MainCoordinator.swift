//
//  MainCoordinator.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 05.06.2022.
//

import UIKit
import Combine
import SwiftUI

class MainCoordinator {
    
    let navogationController: UINavigationController
    
    private let loginViewModel: LoginViewModel = LoginViewModel()
    private var cancellables: Set<AnyCancellable> = []
    
    init(navigationController: UINavigationController) {
        let loginView = VKLoginWebView(viewModel: loginViewModel)
        let loginViewController = UIHostingController(rootView: loginView)
        self.navogationController = UINavigationController(rootViewController: loginViewController)
    }
    
    public func start() {
        loginViewModel.$isAutorized.subscribe(on: RunLoop.main).sink { [weak self] isAutorized in
            guard let self = self else { return }
            if !isAutorized {
                self.navogationController.popToRootViewController(animated: true)
            } else {
                let tabBarView = self.createTabBarView()
                self.navogationController.pushViewController(tabBarView, animated: true)
            }
        }.store(in: &cancellables)
    }
    
    private func createTabBarView() -> UIViewController {
        let tabBarView = TabBarViewCoordinator(viewModel: loginViewModel)
        return UIHostingController(rootView: tabBarView)
    }
}
