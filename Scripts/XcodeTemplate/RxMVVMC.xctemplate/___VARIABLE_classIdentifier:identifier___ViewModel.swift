//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import RxSwift
import RxCocoa

struct ___VARIABLE_classIdentifier___ViewModelConfig {
	
}

class ___VARIABLE_classIdentifier___ViewModel: ___VARIABLE_extendedViewModelClass___, AutoViewModelType {

	typealias Dependencies = HasBaseDependency
	var dependencies: Dependencies
    var coordinator: ___VARIABLE_classIdentifier___CoordinatorType

    // sourcery:begin: viewModelInputs

    // sourcery:end
    
    // sourcery:begin: viewModelOutputs
    
    // sourcery:end
    
    
    init(dependencies: Dependencies, coordinator: ___VARIABLE_classIdentifier___CoordinatorType, config: ___VARIABLE_classIdentifier___ViewModelConfig){
        self.dependencies = dependencies
        self.coordinator = coordinator
       	super.init()
        
    }                                   

}
