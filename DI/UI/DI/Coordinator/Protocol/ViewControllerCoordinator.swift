//
//  ViewControllerCoordinator.swift
//  DI
//
//  Created by Masakazu Sano on 2018/05/12.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import UIKit

protocol ViewControllerCoordinator {
    var viewControllerFactory: ViewControllerFactoryType { get }
    var presenter: UIViewController { get }
    func start()
}
