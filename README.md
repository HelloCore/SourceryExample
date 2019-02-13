# CodeGenTemplate

### Summary

* Dependency Injection
  * แก้ไข AppDependency.swift โดยเพิ่มตัวแปรข้างใน `// sourcery:begin: hasDependencyType`
  * จากนั้น Code Generator จะ Generate Protocol `Hasชื่อตัวแปร`
  * นำ protocol ไปใส่ใน Dependencies ใน viewModel 
* ViewModel
  * เมื่อเพิ่มตัวแปรข้างใน `// sourcery:begin: viewModelInputs` หรือ  `// sourcery:begin: viewModelOutputs` จะ generate interface getter สำหรับตัวแปรนั้นให้
  * เมื่อสร้าง func แล้วต้องการให้ generate interface เพิ่มให้เพิ่ม annotation ข้างบน func นั้นๆ
    * `// sourcery: viewModelInputs` 
    * `// sourcery: viewModelOutputs`



-----

#### Sourcery

##### AutoDependencyType

The class that implemented **AutoDependencyType** will

* Generate protocol `Has*VariableName*` from variables inside `// sourcery:begin: hasDependencyType`

```swift
// Source
class AppDependency: AutoDependencyType {
    
    private let apiProviderFactory: APIProviderFactory
    
    // sourcery:begin: hasDependencyType
    var helloAPIProvider: Reactive<MoyaProvider<HelloTarget>>
    // sourcery:end
    
    init(apiProviderFactory: APIProviderFactory) {
        self.apiProviderFactory = apiProviderFactory
        self.helloAPIProvider = apiProviderFactory.makeProvider(type: HelloTarget.self)
    }
}

// Generate
protocol HasHelloAPIProvider {
    var helloAPIProvider: Reactive<MoyaProvider<HelloTarget>> { get }
}

extension AppDependency: HasHelloAPIProvider {}
```



##### AutoCoordinatorType

The class that implemented **AutoCoordinatorType** will

* Genrate protocol `ClassNameType` from methods which those name started with `navigate`

```swift
// Source
class SplashScreenCoordinator: Coordinator, AutoCoordinatorType {
    func start(parent: Coordinator) { }
    func navigateToMain() { }
    func navigateToLogin() { }
}

// Generated
protocol SplashScreenCoordinatorType {
// sourcery:inline:auto:SplashScreenCoordinatorType.CoordinatorType
    func navigateToMain()
    func navigateToLogin()
// sourcery:end
}

extension SplashScreenCoordinator: SplashScreenCoordinatorType {}

```



##### AutoViewModelType

The class that implemented **AutoViewModelType **will

* Generate protocol `ClassNameInputs` from variables inside `// sourcery:begin: viewModelInputs`
* Generate protocol `ClassNameOutputs` from variables inside `// sourcery:begin: viewModelOutputs`
* Generate protocol `ClassNameType` which contain inputs and outputs
* Implement aforementioned protocols.

```swift
// Source
class SplashScreenViewModel: AutoViewModelType {
    
    // sourcery:begin: viewModelInputs
    var viewDidLoad = PublishRelay<Void>()
    // sourcery:end
    
    // sourcery:begin: viewModelOutputs
    var isShownForceUpdate: Driver<Void>!
    // sourcery:end
    
    // sourcery: viewModelInputs
    func sayHello(to: String) { }
}

// Generated
protocol SplashScreenViewModelInputs {
// sourcery:inline:auto:SplashScreenViewModelInputs.InputsType
    var viewDidLoad: PublishRelay<Void> { get }
    func sayHello(to: String)
// sourcery:end
}

protocol SplashScreenViewModelOutputs {
// sourcery:inline:auto:SplashScreenViewModelOutputs.OutputsType
    var isShownForceUpdate: Driver<Void>! { get }
// sourcery:end
}

```



