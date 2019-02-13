//
//  SplashScreenCoordinator.swift
//  CodeGenTemplate
//
//  Created by Akkharawat Chayapiwat on 10/5/18.
//  Copyright © 2018 Akkharawat Chayapiwat. All rights reserved.
//

import Foundation

class SplashScreenCoordinator: Coordinator, AutoCoordinatorType {
     
    func start(parent: Coordinator) {
        let config = SplashScreenViewModelConfig()
        let nibName = String(describing: SplashScreenViewController.self)
        let bundle = Bundle(for: SplashScreenViewController.self)
        
        let vc = SplashScreenViewController(nibName: nibName, bundle: bundle)
        let viewModel = SplashScreenViewModel(dependencies: self.dependency, coordinator: self, config: config)
        vc.viewModel = viewModel
        
        self.navigationController?.setViewControllers([vc], animated: true)
        parent.replaceAllCoordinator(childCoordinator: self)
    }

    
    func navigateToHome() {
        let homeCoordinator = HomeScreenCoordinator.init(navigationController: self.navigationController,
                                                         dependency: self.dependency)
        homeCoordinator.start(parent: self)
    }
}
