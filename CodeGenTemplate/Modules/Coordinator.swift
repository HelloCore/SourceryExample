//
//  Coordinator.swift
//  CodeGenTemplate
//
//  Created by Akkharawat Chayapiwat on 10/4/18.
//  Copyright © 2018 Akkharawat Chayapiwat. All rights reserved.
//

import Foundation
import UIKit

protocol RootCoordinator { }

class Coordinator {
    
    var dependency: AppDependency
    var childCoordinators: [Coordinator] = []
    
    weak var parentCoordinator: Coordinator?
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?, dependency: AppDependency) {
        self.navigationController = navigationController
        self.dependency = dependency        
    }
    
    deinit {
        log.verbose("\(String(describing: type(of: self))) Deinit")
    }
}

extension Coordinator {
    
    func logCoordinator() {
        log.verbose("-------")
        log.verbose(String(describing: type(of: self)))
        log.verbose("-------")
        var parent = self.parentCoordinator
        while(parent != nil) {
            if let p = parent {
                log.verbose("> \(String(describing: p))")
                parent = p.parentCoordinator
            }
        }
    }
    
    /// Add a child coordinator to the parent
    func addChildCoordinator(childCoordinator: Coordinator) {
        childCoordinator.parentCoordinator = self
        self.childCoordinators.append(childCoordinator)
        childCoordinator.logCoordinator()
    }
    
    /// Remove a child coordinator from the parent
    func removeChildCoordinator(childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator }
        self.logCoordinator()
    }
    
    /// Replace last coordinator
    func replaceChildCoordinator(childCoordinator: Coordinator) {
        if let parent = self.parentCoordinator {
            var newChild = parent.childCoordinators
            if newChild.count >= 1 {
                newChild.removeLast()
            }
            childCoordinator.parentCoordinator = parent
            newChild.append(childCoordinator)
            parent.childCoordinators = newChild
        }
        childCoordinator.logCoordinator()
    }
    
    func removeFromParentCoordinator() {
        if let parent = self.parentCoordinator {
            parent.childCoordinators = parent.childCoordinators.filter { $0 !== self }
            
            parent.logCoordinator()
        }
        
    }
    
    func replaceAllCoordinator(childCoordinator: Coordinator) {
        var topParentCoordinator: Coordinator = self
        while (topParentCoordinator.parentCoordinator != nil) {
            topParentCoordinator = topParentCoordinator.parentCoordinator!
        }
        childCoordinator.parentCoordinator = topParentCoordinator
        topParentCoordinator.childCoordinators = [childCoordinator]
        childCoordinator.logCoordinator()
    }
    
    func popToRootCoordinator() {
        if let parent = self.parentCoordinator {
            if parent is RootCoordinator {
                self.childCoordinators.removeAll()
                self.logCoordinator()
            }else{
                parent.popToRootCoordinator()
            }
        }
    }
    
}
