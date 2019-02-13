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

enum HomeScreenCellType: AutoCaseName {
    case item(title: String)
    case childItem(title: String)
    case loading
}

struct HomeScreenViewModelConfig {
	
}

class HomeScreenViewModel: BaseViewModel, AutoViewModelType {

	typealias Dependencies = HasBaseDependency & HasUserDefaults & HasHelloAPIProvider
	var dependencies: Dependencies
    var coordinator: HomeScreenCoordinatorType

    // sourcery:begin: viewModelInputs
    let onViewDidLoad = PublishRelay<Void>()
    let onWillDisplayCellAtIndex = PublishRelay<Int>()
    // sourcery:end
    
    // sourcery:begin: viewModelOutputs
    var cells: Driver<[HomeScreenCellType]> {
        return Driver.combineLatest(_cells.asDriver(), _isLoading.asDriver(), resultSelector: { (cells, isLoading) -> [HomeScreenCellType] in
            if isLoading {
                var tempCells = cells
                tempCells.append(.loading)
                return tempCells
            }
            return cells
        })
        .startWith(_cells.value)
    }
    // sourcery:end
    
    private let _isLoading = BehaviorRelay<Bool>(value: false)
    private let _cells: BehaviorRelay<[HomeScreenCellType]>
    
    init(dependencies: Dependencies, coordinator: HomeScreenCoordinatorType, config: HomeScreenViewModelConfig){
        self.dependencies = dependencies
        self.coordinator = coordinator
        
        _cells = BehaviorRelay<[HomeScreenCellType]>(value: [
            .item(title: "Hello"),
            .childItem(title: "World 1"),
            .childItem(title: "World 2"),
            .childItem(title: "World 3"),
            .childItem(title: "World 4"),
            .childItem(title: "World 5"),
            .childItem(title: "World 6"),
            .childItem(title: "World 7"),
            .childItem(title: "World 8"),
            .childItem(title: "World 9"),
            .childItem(title: "World 10"),
            .item(title: "World"),
            .childItem(title: "World 1"),
            .childItem(title: "World 2"),
            .item(title: "World A"),
            .item(title: "World B"),
            .item(title: "World C"),
            .item(title: "World D"),
            .item(title: "World E"),
            .item(title: "World F"),
            .item(title: "World G"),
            .item(title: "World H"),
            ])
        
       	super.init()
        
        // simulate load more
        inputs
            .onWillDisplayCellAtIndex
            .asDriverIgnoreError()
            .withLatestFrom(cells) { (index, cells) -> HomeScreenCellType? in
                if cells.count - 1 != index {
                    return nil
                }
                return cells[index]
            }
            .filter({ (cellType) -> Bool in
                guard let cellType = cellType else { return false }
                return cellType.caseName != .loading
            })
            .drive(onNext: { [weak self](_) in
                self?._isLoading.accept(true)
            })
            .disposed(by: disposeBag)
        
        
    }

}
