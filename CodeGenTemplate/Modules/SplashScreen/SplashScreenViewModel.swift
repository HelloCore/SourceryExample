//
//  SplashScreenViewModel.swift
//  CodeGenTemplate
//
//  Created by Akkharawat Chayapiwat on 10/5/18.
//  Copyright © 2018 Akkharawat Chayapiwat. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct SplashScreenViewModelConfig {
	
}

class SplashScreenViewModel: BaseViewModel, AutoViewModelType {

	typealias Dependencies = HasBaseDependency
	var dependencies: Dependencies
    var coordinator: SplashScreenCoordinatorType

    // sourcery:begin: viewModelInputs
    var viewDidLoad = PublishRelay<Void>()
    var usernameChanged = BehaviorRelay<String>(value: "")
    // sourcery:end
    
    // sourcery:begin: viewModelOutputs
    
    // sourcery:end
    
    
    init(dependencies: Dependencies, coordinator: SplashScreenCoordinatorType, config: SplashScreenViewModelConfig){
        self.dependencies = dependencies
        self.coordinator = coordinator
       	super.init()
        
        viewDidLoad
            .asDriver(onErrorJustReturn: ())
            .drive(onNext: coordinator.navigateToHome)
            .disposed(by: disposeBag)
    }
    
    func helloWorld(text: String) {
        
    }
}
