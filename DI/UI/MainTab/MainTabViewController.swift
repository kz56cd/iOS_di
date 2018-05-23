//
//  MainTabViewController.swift
//  DI
//
//  Created by Masakazu Sano on 2018/05/14.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import UIKit

final class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        prepareMainTab()
        prepareNavigationBar()
    }
}

extension MainTabViewController {
    fileprivate func prepareMainTab() {
        UITabBar.appearance().tintColor = .purple
        tabBar.barTintColor = .white
        tabBar.backgroundColor = .white
    }

    fileprivate func prepareNavigationBar() {
        UINavigationBar.appearance().backgroundColor = .white
    }

}

extension MainTabViewController: UITabBarControllerDelegate {
    func tabBarController(
        _ tabBarController: UITabBarController,
        shouldSelect viewController: UIViewController
        ) -> Bool {
        // stub
        return true
    }
}
