//
//  HomeScreenViewModel.swift
//  CodeGenTemplate
//
//  Created by Akkharawat Chayapiwat on 10/5/18.
//  Copyright © 2018 Akkharawat Chayapiwat. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct HomeScreenViewModelConfig {
	
}

class HomeScreenViewModel: BaseViewModel, AutoViewModelType {

	typealias Dependencies = HasBaseDependency & HasUserDefaults & HasHelloAPIProvider
	var dependencies: Dependencies
    var coordinator: HomeScreenCoordinatorType

    // sourcery:begin: viewModelInputs
    let onViewDidLoad = PublishRelay<Void>()
    // sourcery:end
    
    // sourcery:begin: viewModelOutputs
    // sourcery:end
    
    private let _isLoading = BehaviorRelay<Bool>(value: false)
    
    init(dependencies: Dependencies, coordinator: HomeScreenCoordinatorType, config: HomeScreenViewModelConfig){
        self.dependencies = dependencies
        self.coordinator = coordinator
       	super.init()
    
        
    }

}
