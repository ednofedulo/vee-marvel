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
    
    func start() {
        var viewModel = HomeViewModel()
        let viewController = HomeTableViewController(viewModel: viewModel)
        viewModel.viewDelegate = viewController
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showDetail(for character: MarvelCharacter) {
        var detailViewModel = DetailViewModel()
        let viewController = DetailViewController(viewModel: detailViewModel)
        detailViewModel.delegate = viewController
        navigationController.pushViewController(viewController, animated: true)
    }
}
