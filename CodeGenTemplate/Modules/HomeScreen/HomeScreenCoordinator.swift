//
//  HomeScreenCoordinator.swift
//  CodeGenTemplate
//
//  Created by Akkharawat Chayapiwat on 10/5/18.
//  Copyright © 2018 Akkharawat Chayapiwat. All rights reserved.
//

import Foundation

class HomeScreenCoordinator: Coordinator, AutoCoordinatorType {
     
    func start(parent: Coordinator) {
        let config = HomeScreenViewModelConfig()

        let nibName = String(describing: HomeScreenViewController.self)
        let bundle = Bundle(for: HomeScreenViewController.self)
        let vc = HomeScreenViewController(nibName: nibName, bundle: bundle)
        let viewModel = HomeScreenViewModel(dependencies: self.dependency, coordinator: self, config: config)
        vc.viewModel = viewModel
        
        self.navigationController?.pushViewController(vc, animated: true)
        parent.addChildCoordinator(childCoordinator: self)
    }
}
