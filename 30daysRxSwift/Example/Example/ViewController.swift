//
//  ViewController.swift
//  Example
//
//  Created by harry on 16/3/6.
//  Copyright © 2016年 hv. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    lazy var disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .None
        
        let data = Observable.just(["Demo1", "Demo2"])
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        data.bindTo(tableView.rx_itemsWithCellIdentifier("cell", cellType: UITableViewCell.self)) { (row, element, cell) in
                cell.textLabel?.text = element
            }
            .addDisposableTo(disposeBag)
        
        tableView.rx_modelSelected(String.self)
            .subscribeNext { [weak self] element in
                switch element {
                case "Demo1":
                    let vc = Demo1ViewController()
                    self?.navigationController?.pushViewController(vc, animated: true)
                case "Demo2":
                    let vc = Demo2ViewController()
                    self?.navigationController?.pushViewController(vc, animated: true)
                default: break
                }
            }
            .addDisposableTo(disposeBag)
    }

}

