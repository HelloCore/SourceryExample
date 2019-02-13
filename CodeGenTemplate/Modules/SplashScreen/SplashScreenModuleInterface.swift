//
//  SplashScreenModuleInterface.swift
//  CodeGenTemplate
//
//  Created by Akkharawat Chayapiwat on 10/5/18.
//  Copyright © 2018 Akkharawat Chayapiwat. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol SplashScreenCoordinatorType {
// sourcery:inline:auto:SplashScreenCoordinatorType.CoordinatorType
	func navigateToHome()
// sourcery:end
 }
extension SplashScreenCoordinator: SplashScreenCoordinatorType {}

protocol SplashScreenViewModelInputs {
// sourcery:inline:auto:SplashScreenViewModelInputs.InputsType
	var viewDidLoad: PublishRelay<Void> { get }
	var usernameChanged: BehaviorRelay<String> { get }
// sourcery:end
 }
protocol SplashScreenViewModelOutputs {
// sourcery:inline:auto:SplashScreenViewModelOutputs.OutputsType
// sourcery:end
 }

extension SplashScreenViewModel: SplashScreenViewModelInputs {}
extension SplashScreenViewModel: SplashScreenViewModelOutputs {}

protocol SplashScreenViewModelType {
    var inputs: SplashScreenViewModelInputs { get }
    var ouputs: SplashScreenViewModelOutputs { get }
}

extension SplashScreenViewModel: SplashScreenViewModelType {
    var inputs: SplashScreenViewModelInputs { return self }
    var ouputs: SplashScreenViewModelOutputs { return self }
}

