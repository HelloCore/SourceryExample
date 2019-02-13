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

protocol ___VARIABLE_classIdentifier___CoordinatorType { }
extension ___VARIABLE_classIdentifier___Coordinator: ___VARIABLE_classIdentifier___CoordinatorType {}

protocol ___VARIABLE_classIdentifier___ViewModelInputs { }
protocol ___VARIABLE_classIdentifier___ViewModelOutputs { }

extension ___VARIABLE_classIdentifier___ViewModel: ___VARIABLE_classIdentifier___ViewModelInputs {}
extension ___VARIABLE_classIdentifier___ViewModel: ___VARIABLE_classIdentifier___ViewModelOutputs {}

protocol ___VARIABLE_classIdentifier___ViewModelType {
    var inputs: ___VARIABLE_classIdentifier___ViewModelInputs { get }
    var ouputs: ___VARIABLE_classIdentifier___ViewModelOutputs { get }
}

extension ___VARIABLE_classIdentifier___ViewModel: ___VARIABLE_classIdentifier___ViewModelType {
    var inputs: ___VARIABLE_classIdentifier___ViewModelInputs { return self }
    var ouputs: ___VARIABLE_classIdentifier___ViewModelOutputs { return self }
}

