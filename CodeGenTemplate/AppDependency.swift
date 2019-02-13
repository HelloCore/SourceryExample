//
//  AppDependency.swift
//  CodeGenTemplate
//
//  Created by Akkharawat Chayapiwat on 10/4/18.
//  Copyright © 2018 Akkharawat Chayapiwat. All rights reserved.
//

import Foundation
import RxSwift
import Moya


class AppDependency: HasBaseDependency, AutoDependencyType {
    
    // sourcery:begin: hasDependencyType
    var helloAPIProvider: Reactive<MoyaProvider<HelloTarget>>
    var userDefaults: UserDefaults
    // sourcery:end
    
    init(plugins: [PluginType], userDefaults: UserDefaults) {
        self.helloAPIProvider = MoyaProvider<HelloTarget>(plugins: plugins).rx
        self.userDefaults = userDefaults
    }
    
}

