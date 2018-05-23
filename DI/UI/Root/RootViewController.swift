//
//  RootViewController.swift
//  DI
//
//  Created by Masakazu Sano on 2018/05/12.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import UIKit
import Prelude

final class RootViewController: UIViewController, ContainerViewShowing {

    var viewController: UIViewController?

    @IBOutlet weak var containerView: UIView!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        prepareContainerView()
    }
}

extension RootViewController {
    fileprivate func prepareContainerView() {
        guard let viewController = viewController else { return }
        self.addChildViewController(viewController, to: containerView)
    }
}
