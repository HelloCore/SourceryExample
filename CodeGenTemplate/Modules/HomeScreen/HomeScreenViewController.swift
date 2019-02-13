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
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Hello"
        
        viewModel
            .ouputs
            .cells
            .drive(tableView.rx.items) { (tableView, row, element) in
                switch element {
                case .item(let title):
                    let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "ITEM_CELL")
                    cell.textLabel?.text = title
                    return cell
                    
                case .childItem(let title):
                    let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "CHILD_ITEM_CELL")
                    cell.textLabel?.text = "-> \(title)"
                    return cell
                    
                case .loading:
                    
                    let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "LOADING_CELL")
                    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
                    cell.addSubview(activityIndicator)
                    
                    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
                    NSLayoutConstraint.activate([
                        activityIndicator.topAnchor.constraint(equalTo: cell.topAnchor),
                        activityIndicator.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
                        activityIndicator.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
                        activityIndicator.bottomAnchor.constraint(equalTo: cell.bottomAnchor),
                        ])
                    
                    activityIndicator.startAnimating()
                    return cell
                    
                }
            }
            .disposed(by: disposeBag)
        
        tableView.rx.willDisplayCell
            .asDriver()
            .map { (cell, indexPath) -> Int in
                return indexPath.row
            }
            .drive(viewModel.inputs.onWillDisplayCellAtIndex)
            .disposed(by: disposeBag)
        
        
        
        
    }

}
