//
//  AppCoordinator.swift
//  vee-marvel
//
//  Created by Edno Fedulo on 30/10/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    var navigationController: UINavigationController { get }
    func start()
}

class AppCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    /// show the first view of the app
    func start() {
        let viewModel = HomeViewModel()
        viewModel.coodinator = self
        let viewController = HomeTableViewController(viewModel: viewModel)
        viewModel.viewDelegate = viewController
        navigationController.pushViewController(viewController, animated: true)
    }
    
    /// Navigate to detail screen
    /// - Parameter character: Marvel character
    func showDetail(for character: MarvelCharacter) {
        let detailViewModel = DetailViewModel(character: character)
        let viewController = DetailViewController(viewModel: detailViewModel)
        detailViewModel.viewDelegate = viewController
        navigationController.pushViewController(viewController, animated: true)
    }
}
