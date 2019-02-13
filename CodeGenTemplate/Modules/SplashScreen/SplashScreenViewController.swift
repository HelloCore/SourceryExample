//
//  SplashScreenViewController.swift
//  CodeGenTemplate
//
//  Created by Akkharawat Chayapiwat on 10/5/18.
//  Copyright © 2018 Akkharawat Chayapiwat. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SplashScreenViewController: BaseViewController {

    var viewModel: SplashScreenViewModelType!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Splash Screen"
        
        viewModel.inputs.viewDidLoad.accept(())
    }

}
