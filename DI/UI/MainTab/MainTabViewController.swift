//
//  MainTabViewController.swift
//  DI
//
//  Created by Masakazu Sano on 2018/05/14.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
}

extension MainTabViewController: UITabBarControllerDelegate {
    // stub
}
