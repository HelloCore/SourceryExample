//
//  AppCoordinator.swift
//  CodeGenTemplate
//
//  Created by Akkharawat Chayapiwat on 10/4/18.
//  Copyright © 2018 Akkharawat Chayapiwat. All rights reserved.
//

import Foundation

final class AppCoordinator: Coordinator {
    
    func start() {
        let coordinator = SplashScreenCoordinator.init(navigationController: self.navigationController,
                                                       dependency: self.dependency)
        coordinator.start(parent: self)
    }
    
}
