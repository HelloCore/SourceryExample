//
//  HomeScreenModuleInterface.swift
//  CodeGenTemplate
//
//  Created by Akkharawat Chayapiwat on 10/5/18.
//  Copyright © 2018 Akkharawat Chayapiwat. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol HomeScreenCoordinatorType {
// sourcery:inline:auto:HomeScreenCoordinatorType.CoordinatorType
// sourcery:end
 }

extension HomeScreenCoordinator: HomeScreenCoordinatorType {}

protocol HomeScreenViewModelInputs {
// sourcery:inline:auto:HomeScreenViewModelInputs.InputsType
	var onViewDidLoad: PublishRelay<Void> { get }
	var onWillDisplayCellAtIndex: PublishRelay<Int> { get }
// sourcery:end
 }
protocol HomeScreenViewModelOutputs {
// sourcery:inline:auto:HomeScreenViewModelOutputs.OutputsType
	var cells: Driver<[HomeScreenCellType]> { get }
// sourcery:end
 }

extension HomeScreenViewModel: HomeScreenViewModelInputs {}
extension HomeScreenViewModel: HomeScreenViewModelOutputs {}

protocol HomeScreenViewModelType {
    var inputs: HomeScreenViewModelInputs { get }
    var ouputs: HomeScreenViewModelOutputs { get }
}

extension HomeScreenViewModel: HomeScreenViewModelType {
    var inputs: HomeScreenViewModelInputs { return self }
    var ouputs: HomeScreenViewModelOutputs { return self }
}

