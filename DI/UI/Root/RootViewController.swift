//
//  RootViewController.swift
//  DI
//
//  Created by Masakazu Sano on 2018/05/12.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import UIKit
//import 

final class RootViewController: UIViewController {
    
    var viewController: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension RootViewController {
    fileprivate func prepareContainerView() {
        guard let viewController = viewController else { return }
        
    }
}
