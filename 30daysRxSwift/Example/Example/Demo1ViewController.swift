//
//  Demo1ViewController.swift
//  Example
//
//  Created by harry on 16/4/24.
//  Copyright © 2016年 hv. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Demo1ViewController: UIViewController {

    lazy var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .whiteColor()
        edgesForExtendedLayout = .None
        
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 40))
        view.addSubview(label)
        
        let button = UIButton(type: .System)
        button.frame = CGRect(x: 100, y: 200, width: 100, height: 40)
        button.setTitle("Test", forState: .Normal)
        view.addSubview(button)
        
        let textField = UITextField(frame: CGRect(x: 100, y: 300, width: 100, height: 40))
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGrayColor().CGColor
        view.addSubview(textField)
        
        button.rx_tap
            .map { _ in "Test" }
            .bindTo(label.rx_text)
            .addDisposableTo(disposeBag)
        
        textField.rx_text
            .bindTo(label.rx_text)
            .addDisposableTo(disposeBag)
    }

}
