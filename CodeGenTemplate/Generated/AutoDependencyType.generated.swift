// Generated using Sourcery 0.15.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import RxSwift
import RxCocoa
import Moya

// MARK: - HasHelloAPIProvider 
protocol HasHelloAPIProvider {
	var helloAPIProvider: Reactive<MoyaProvider<HelloTarget>> { get }
}

extension AppDependency: HasHelloAPIProvider {}

// MARK: - HasUserDefaults 
protocol HasUserDefaults {
	var userDefaults: UserDefaults { get }
}

extension AppDependency: HasUserDefaults {}


