//
//  Demo2ViewController.swift
//  Example
//
//  Created by harry on 16/5/8.
//  Copyright © 2016年 hv. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Demo2ViewController: UIViewController {
    
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .None
        view.backgroundColor = .whiteColor()
        
        let textField1 = UITextField(frame: CGRect(x: 10, y: 10, width: 100, height: 30))
        textField1.borderStyle = .RoundedRect
        view.addSubview(textField1)
        let textField2 = UITextField(frame: CGRect(x: 10, y: 50, width: 100, height: 30))
        textField2.borderStyle = .RoundedRect
        view.addSubview(textField2)
        
        let button = UIButton(type: .Custom)
        button.frame = CGRect(x: 10, y: 90, width: 100, height: 30)
        button.setTitleColor(.blackColor(), forState: .Normal)
        button.setTitleColor(.redColor(), forState: .Disabled)
        view.addSubview(button)
        button.setTitle("OK", forState: .Normal)
        button.setTitle("Disabled", forState: .Disabled)
        
        Observable
            .combineLatest(textField1.rx_text, textField2.rx_text) { ($0, $1) }
            .map { $0.characters.count > 6 && $1.characters.count > 6 }
            .bindTo(button.rx_enabled)
            .addDisposableTo(disposeBag)
    }

}
