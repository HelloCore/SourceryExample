//
//  HomeScreenViewController.swift
//  CodeGenTemplate
//
//  Created by Akkharawat Chayapiwat on 10/5/18.
//  Copyright © 2018 Akkharawat Chayapiwat. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeScreenViewController: BaseViewController {

    var viewModel: HomeScreenViewModelType!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Hello"
    }

}
