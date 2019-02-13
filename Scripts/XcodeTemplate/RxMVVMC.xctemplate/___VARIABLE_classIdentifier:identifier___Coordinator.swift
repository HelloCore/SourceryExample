//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation

class ___VARIABLE_classIdentifier___Coordinator: Coordinator, AutoCoordinatorType {
     
    func start(parent: Coordinator) {
        let config = ___VARIABLE_classIdentifier___ViewModelConfig()

        let nibName = String(describing: ___VARIABLE_classIdentifier___ViewController.self)
        let bundle = Bundle(for: ___VARIABLE_classIdentifier___ViewController.self)
        let vc = ___VARIABLE_classIdentifier___ViewController(nibName: nibName, bundle: bundle)
        let viewModel = ___VARIABLE_classIdentifier___ViewModel(dependencies: self.dependency, coordinator: self, config: config)
        vc.viewModel = viewModel
        
        self.navigationController?.pushViewController(vc, animated: true)
        parent.addChildCoordinator(childCoordinator: self)
    }

}
